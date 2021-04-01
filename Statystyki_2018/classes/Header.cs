using System.Data;

namespace Statystyki_2018
{
    public class Header : common
    {
        public DevExpress.Web.MenuItem daneDoManuKontrolek(string identyfikatorUzytkownika)
        {
            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów meny kontrolek");
            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Kontrolka");

            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu kontrolka");

            DataTable parametry = makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            string kwerenda = "SELECT ident, opis, wartosc FROM konfig  WHERE(klucz = 'kontrolka') order by opis";               // admin
            // czy admin
            if (getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", con_str, parametry) != "1")
            {
                kwerenda = "SELECT DISTINCT konfig.ident, konfig.opis, konfig.wartosc, konfig.klucz FROM uprawnienia INNER JOIN konfig ON uprawnienia.id_wydzialu  = konfig.ident WHERE        (uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) AND (uprawnienia.rodzaj =3 )  AND (rtrim(konfig.klucz) = 'kontrolka') order by konfig.opis";
            }
            DataTable dTable = getDataTable(kwerenda, con_str, parametry, "naglowek");
            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem(dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", "nowa.aspx?id=" + dRow[0].ToString().Trim(), "_self");
                //mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                mm1.Items.Add(mm2);
            }

            //log.Info("Header: zakonczenie procedury tworzenia elementów menu kontrolek");

            return mm1;
        }

        public DevExpress.Web.MenuItem daneDoManuMiesieczne(string identyfikatorUzytkownika)
        {
            //czy admin
            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk miesięcznych dla użytkownika: " + identyfikatorUzytkownika);

            DevExpress.Web.MenuItem item = new DevExpress.Web.MenuItem("Statystyka");

            string admin = string.Empty;
            DataTable parametry = makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            //log.Info("Header: Sprawdz czy użytkownik " + identyfikatorUzytkownika + " ma parawa administratora" );
            admin = "0";

            try
            {
                admin = getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", con_str, parametry);
                //log.Info("Header: Użytkownik ma prawa administracyjne");
            }
            catch
            { }
            string kwerenda = "SELECT DISTINCT wydzialy.ident, wydzialy.nazwa, wydzialy.plik FROM wydzialy INNER JOIN uprawnienia ON wydzialy.ident = uprawnienia.id_wydzialu WHERE(uprawnienia.rodzaj = 1) AND(uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) order by wydzialy.nazwa";

            if (admin == "1")
            {
                // admin
                kwerenda = "SELECT DISTINCT wydzialy.ident, wydzialy.nazwa, wydzialy.plik FROM wydzialy INNER JOIN uprawnienia ON wydzialy.ident = uprawnienia.id_wydzialu WHERE(uprawnienia.rodzaj = 1) order by wydzialy.nazwa";
            }

            //log.Info("Header: odczyt działów przypisanych do uzytkownika id= "+ identyfikatorUzytkownika);
            DataTable dTable = getDataTable(kwerenda, con_str, parametry, "");
            //log.Info("Header: Uzytkownika id= " + identyfikatorUzytkownika+ " ma prawa do "+dTable.Rows.Count.ToString () +" wydziałów");

            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem(dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", dRow[2].ToString().Trim() + "?w=" + dRow[0].ToString().Trim(), "_self");
                //mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                item.Items.Add(mm2);
                //log.Info("Header: dodano wydzial " + dRow[1].ToString().Trim() + " do menu ");
            }
            return item;
        }

        public DevExpress.Web.MenuItem daneDoManuMSS(string identyfikatorUzytkownika)
        {
            //czy admin
            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk MS-S");

            DevExpress.Web.MenuItem item = new DevExpress.Web.MenuItem("MS-S");

            DataTable parametry = makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            string kwerenda = string.Empty;
            // czy admin
            if (getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", con_str, parametry) == "1")
            {
                kwerenda = "SELECT DISTINCT wydzialy_mss.ident, wydzialy_mss.nazwa, wydzialy_mss.plik FROM wydzialy_mss INNER JOIN uprawnienia ON wydzialy_mss.ident = uprawnienia.id_wydzialu WHERE(uprawnienia.rodzaj = 2)  order by wydzialy_mss.nazwa";                                 // admin
            }
            else
            {
                kwerenda = "SELECT DISTINCT wydzialy_mss.ident, wydzialy_mss.nazwa, wydzialy_mss.plik FROM wydzialy_mss INNER JOIN uprawnienia ON wydzialy_mss.ident = uprawnienia.id_wydzialu WHERE(uprawnienia.rodzaj = 2) AND(uprawnienia.id_uzytkownika = @identyfikatorUzytkownika) order by wydzialy_mss.nazwa";
                //SELECT DISTINCT wydzialy_mss.ident as id_wydzialu, wydzialy_mss.nazwa, wydzialy_mss.plik FROM  uprawnienia LEFT OUTER JOIN wydzialy_mss ON uprawnienia.id_wydzialu = wydzialy_mss.ident + 200 WHERE        (uprawnienia.id_uzytkownika = 8) AND (uprawnienia.id_wydzialu >= 200) AND (wydzialy_mss.ident IS NOT NULL)
            }
            DataTable dTable = getDataTable(kwerenda, con_str, parametry, "Naglowki");
            foreach (DataRow dRow in dTable.Rows)
            {
                DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem(dRow[1].ToString().Trim(), dRow[0].ToString().Trim(), "", dRow[2].ToString().Trim() + "?w=" + dRow[0].ToString().Trim(), "_self");
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                item.Items.Add(mm2);
            }
            return item;
        }

        public DevExpress.Web.MenuItem daneDoManuInne(string identyfikatorUzytkownika)
        {
            //czy admin
            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk MS-S");

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Inne");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();
            //sprawdzenie czy sa uprawnienia do oceny
            DataTable parametry = makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            int iloscUprawnienOceny = int.Parse(getQuerryValue("SELECT COUNT(*) FROM  uprawnienia WHERE (rodzaj = 6) and id_uzytkownika=@identyfikatorUzytkownika", con_str, parametry, "Header - sprawdzanie oceny pracownika"));
            if (iloscUprawnienOceny > 0)
            {
                mm2 = new DevExpress.Web.MenuItem("Ocena pracownika Nowa", "", "", "ocenaPracownika.aspx", "_self");
                mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                mm1.Items.Add(mm2);
            }
            int iloscUprawnienKOF = int.Parse(getQuerryValue("SELECT COUNT(*) FROM  uprawnienia WHERE (rodzaj = 4) and id_uzytkownika=@identyfikatorUzytkownika", con_str, parametry, "Header - sprawdzanie oceny pracownika"));
            if (iloscUprawnienKOF > 0)
            {
                mm2 = new DevExpress.Web.MenuItem("Kontrolka KOF", "", "", "kof.aspx", "_self");
                mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                mm1.Items.Add(mm2);
            }

            mm2 = new DevExpress.Web.MenuItem("Wyszukiwarka Spraw", "", "", "wyszukiwarkaSpraw.aspx", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;
            mm1.Items.Add(mm2);

            return mm1;
        }

        public DevExpress.Web.MenuItem daneDoManuWymiana(string identyfikatorUzytkownika)
        {
            //czy admin
          

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Wymiana");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();
            //sprawdzenie czy sa uprawnienia do wymiany
            DataTable parametry = makeParameterTable();
            parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
            int iloscUprawnienWymiana = int.Parse(getQuerryValue("SELECT COUNT(*) FROM  uprawnienia WHERE (rodzaj = 7) and id_uzytkownika=@identyfikatorUzytkownika", con_str, parametry, "Header - sprawdzanie wymiany "));
            if (iloscUprawnienWymiana > 0)
            {
                mm2 = new DevExpress.Web.MenuItem("Wymiana", "", "", "Wymiana1.aspx", "_self");
                mm2.ItemStyle.Width = 300;
                mm2.ItemStyle.Paddings.PaddingLeft = 30;
                mm1.Items.Add(mm2);
            }

            return mm1;
        }

        public DevExpress.Web.MenuItem daneDoManuAdmin()
        {
            //czy admin
            //log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu statystyk MS-S");

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Administracja");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();

            mm2 = new DevExpress.Web.MenuItem("Panel Administracyjny", "", "", "adm.aspx", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;
            mm1.Items.Add(mm2);

            return mm1;
        }

        public DevExpress.Web.MenuItem wyloguj()
        {
            //czy admin
            log.Info("Header: Rozpoczęcie procedury tworzenia elementów menu wyloguj");

            DevExpress.Web.MenuItem mm1 = new DevExpress.Web.MenuItem("Wylogowanie");
            DevExpress.Web.MenuItem mm2 = new DevExpress.Web.MenuItem();

            mm2 = new DevExpress.Web.MenuItem("Wyloguj", "", "", "default.aspx?logout=true", "_self");
            mm2.ItemStyle.Width = 300;
            mm2.ItemStyle.Paddings.PaddingLeft = 30;

            mm1.Items.Add(mm2);
            return mm1;
        }
    }
}
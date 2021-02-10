/*
Last Update:
    - version 1.181121
Creation date: 2018-11-21

*/
using System.Data;

namespace Statystyki_2018
{
    public class logowanie
    {
        public common cm = new common();

        public string loguj(string user_, string haslo)
        {
            //cm.log.Info("Logowanie: Rozpoczęcie procedury logowania dla użytkownika: "+user_);
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@login", user_);
            parameters.Rows.Add("@passwd", haslo);
            string odp = cm.getQuerryValue("SELECT ident FROM uzytkownik where rtrim(login)=@login and rtrim(password)=@passwd ", cm.con_str, parameters);
            cm.log.Info("Logowanie: identyfikator użytkownika: " + user_ + " to " + odp);
            return odp;
        } // end of loguj

        public string PodajDaneUzytkownika(string user_)
        {
            //cm.log.Info("Rozpoczęcie procedury odczytu danych uzytkownika "+ user_);
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@login", user_);
            return cm.getQuerryValue("SELECT distinct Imie +' '+ nazwisko FROM uzytkownik where rtrim(login)=@login", cm.con_str, parameters);
        } // end of loguj

        public string CzyJestUzytkownikwBazie(string user_)
        {
            //cm.log.Info("Rozpoczęcie procedury sprawdzania istnienia uzytkownika " + user_ +" wbazie danych");
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@login", user_);
            return cm.getQuerryValue("SELECT count (*)  FROM uzytkownik where login=@login", cm.con_str, parameters);
        } // end of loguj

        public string podajIdUzytkownikaDomenowego(string user_)
        {
            //cm.log.Info("Rozpoczęcie procedury pobierania danych użytkownika domenowego: " + user_ );
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@login", user_);
            return cm.getQuerryValue("SELECT ident  FROM uzytkownik where rtrim(login_domenowy)=@login", cm.con_str, parameters);
        } // end of loguj
    }
}
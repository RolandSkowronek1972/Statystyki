using System;
using System.Configuration;
using System.Data;
using System.IO;
using OfficeOpenXml;


namespace stat2018
{
    public partial class 2ocenasedziego : System.Web.UI.Page
    {
        public string con_str = ConfigurationManager.ConnectionStrings["wap"].ConnectionString;
        public SsrSso ccr = new SsrSso();

        public Class1 cl = new Class1();




        protected void Page_Load(object sender, EventArgs e)
        {
            int pos = 0;

            try
            {
                pos = (int)Session["position"];
            }
            catch
            {


            }

            string date = Request.Form[Date1.Text];
            if (!IsPostBack)
            {
                try
                {
                    // file read
                    try
                    {
                        var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                        this.Title = "Statystyki " + fileContents.ToString().Trim();
                    }
                    catch
                    {
                    }


                    string txt = (string)Session["user_id"];
                    if (string.IsNullOrEmpty((txt)))
                    {
                        //Server.Transfer("default.aspx");
                    }
                    else
                    {
                        if (Session["id_dzialu"] == null)
                        {
                            // Server.Transfer("default.aspx");
                            Session["id_dzialu"] = "1";
                        }

                    }


                }
                catch
                {
                    //Server.Transfer("default.aspx");
                }

            }
            int lic = 0;
            try
            {
                lic = (int)Session["stat_01"];
            }
            catch
            {
                //Server.Transfer("default.aspx");
            }


            makeDatas();
            switch (lic)
            {
                case 1:
                    {
                        Label5.Text = "To tylko wersja demo bez przeliczenia danych liczbowych";
                        LinkButton54.Enabled = false;


                    }
                    break;
                case 2:
                    {
                        przemiel();
                        Label5.Text = "";
                        LinkButton54.Enabled = true;
                    }

                    break;
                default:
                    {
                        Server.Transfer("default.aspx");
                    }
                    break;
            }

            Session["id_dzialu"] = "1";
            string cs = cl.podajConnectionString(int.Parse((string)Session["id_dzialu"]));
            DataTable dT = cl.listaSedziow(cs, int.Parse((string)Session["id_dzialu"]));

            DropDownList1.Items.Clear();
            foreach (DataRow dR in dT.Rows)
            {

                DropDownList1.Items.Add(dR[1].ToString().Trim() + " " + dR[2].ToString().Trim());
            }
            if (DropDownList1.SelectedIndex == -1)
            {
                DropDownList1.SelectedIndex = pos;


            }

            Label36.Text = DropDownList1.SelectedItem.Value.ToString();
            Label43.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString() + " w ujęciu liczbowym";
            Label1.Text = "Terminowość sporządzania uzasadnień (od 1 stycznia 2013 do 31 marca 2016 r.) - SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label164.Text = "Liczba spraw w referacie (na ostatni dzień okresu statystycznego) - SSR " + DropDownList1.SelectedValue.ToString() + " w Sądzie Rejonowym";
            Label325.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label364.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label346.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label376.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label529.Text = "-SSR " + DropDownList1.SelectedItem.Value.ToString() + " w Sądzie Okręgowym (w okresie delegacji)";
            Label545.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label556.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label567.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label573.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
            Label578.Text = "SSR " + DropDownList1.SelectedItem.Value.ToString();
        }// end of Page_Load

        protected void przemiel()
        {


            string idDzialu = "1"; //(string)Session["id_dzialu"];
            getTabData_z1s1(idDzialu);//sekcaja1 
            getTabData_z1s2(idDzialu);//sekcaja2 
            getTabData_z1s3(idDzialu);//sekcaja3 
            getTabData_z1s4(idDzialu);//sekcaja4 
            getTabData_z1s5(idDzialu);//sekcaja5 
                                      //zakladka 2
            getTabData_z2s1(idDzialu);
            // zakladka 3
            getTabData_z3s1(idDzialu);//sekcaja1 
            getTabData_z3s2(idDzialu);//sekcaja2 
            getTabData_z3s3(idDzialu);//sekcaja3 
            getTabData_z3s4(idDzialu);//sekcaja4 
            getTabData_z3s5(idDzialu);//sekcaja5 
            getTabData_z3s6(idDzialu);//sekcaja5 
                                      //zakladka  4
            getTabData_z4s1(idDzialu);//sekcaja1 
            getTabData_z4s2(idDzialu);//sekcaja2 
            getTabData_z4s3(idDzialu);//sekcaja3 
            getTabData_z4s4(idDzialu);//sekcaja4 
                                      //zakladka 5
            getTabData_z5s1(idDzialu);//sekcaja1 
            getTabData_z5s2(idDzialu);//sekcaja2 
            getTabData_z5s3(idDzialu);//sekcaja3 
            getTabData_z5s4(idDzialu);//sekcaja4 
                                      //zakladka 6
            getTabData_z6s1(idDzialu);//sekcaja1 
                                      //zakladka 7
            getTabData_z7s1(idDzialu);//sekcaja1 
            getTabData_z7s2(idDzialu);//sekcaja2 
            getTabData_z7s3(idDzialu);//sekcaja3 
            getTabData_z7s4(idDzialu);//sekcaja4 
            getTabData_z7s5(idDzialu);//sekcaja5 
                                      //zakdaka 8

            // ladowanie listy sedziow
            string cs = cl.podajConnectionString(int.Parse(idDzialu));
            DataTable dT = cl.listaSedziow(cs, int.Parse(idDzialu));
            DropDownList1.Items.Clear();
            foreach (DataRow dR in dT.Rows)
            {

                DropDownList1.Items.Add(dR[1].ToString().Trim() + " " + dR[2].ToString().Trim());
            }



        }




        protected void makeDatas()
        {

            try
            {


                if (Date1.Text.Length == 0)
                {
                    Date1.Text = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString("D2") + "-01";
                }
                if (Date2.Text.Length == 0)
                {
                    Date2.Text = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Month.ToString("D2") + "-" + DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month).ToString("D2");
                }
                DateTime dateNow = DateTime.Parse(Date2.Text.Trim());
                dateLabel1.Text = (dateNow.Year - 3).ToString();
                dateLabel2.Text = (dateNow.Year - 2).ToString();
                dateLabel3.Text = (dateNow.Year - 1).ToString();
                dateLabel4.Text = (dateNow.Year).ToString();
                dataLabelSR4.Text = "(od " + Date1.Text + " do " + Date2.Text + ".)";
                dataLabelSR5.Text = "(od " + Date1.Text + " do " + Date2.Text + ".)";
                Label528.Text = "(od " + Date1.Text + " do " + Date2.Text + ".)";
                Label588.Text = "Wynik postępowania apelacyjnego (od " + Date1.Text + " do " + Date2.Text + ")";
                Label588.Text = "Wynik postępowania apelacyjnego (od " + Date1.Text + " do " + Date2.Text + ")";
                dataLabelSR6.Text = "(od " + Date1.Text + " do " + Date2.Text + ".)";

                //pierwsze dane


                dateLabel11.Text = (dateNow.Year - 3).ToString();
                dateLabel12.Text = (dateNow.Year - 2).ToString();
                dateLabel13.Text = (dateNow.Year - 1).ToString();
                dateLabel14.Text = (dateNow.Year).ToString();

                dataLabelSO11.Text = (dateNow.Year - 3).ToString();
                dataLabelSO12.Text = (dateNow.Year - 2).ToString();
                dataLabelSO13.Text = (dateNow.Year - 1).ToString();
                dataLabelSO14.Text = (dateNow.Year).ToString();
                //sr3
                dT11.Text = Date2.Text;
                dT12.Text = (dateNow.Year - 1).ToString() + " rok";
                dT13.Text = (dateNow.Year - 2).ToString() + " rok";
                dT14.Text = (dateNow.Year - 3).ToString() + " rok";

                dT21.Text = Date2.Text;
                dT22.Text = (dateNow.Year - 1).ToString() + " rok";
                dT23.Text = (dateNow.Year - 2).ToString() + " rok";
                dT24.Text = (dateNow.Year - 3).ToString() + " rok";

                dT31.Text = Date2.Text;
                dT32.Text = (dateNow.Year - 1).ToString() + " rok";
                dT33.Text = (dateNow.Year - 2).ToString() + " rok";
                dT34.Text = (dateNow.Year - 3).ToString() + " rok";


                dT41.Text = Date2.Text;
                dT42.Text = (dateNow.Year - 1).ToString() + " rok";
                dT43.Text = (dateNow.Year - 2).ToString() + " rok";
                dT44.Text = (dateNow.Year - 3).ToString() + " rok";

                dT51.Text = Date2.Text;
                dT52.Text = (dateNow.Year - 1).ToString() + " rok";
                dT53.Text = (dateNow.Year - 2).ToString() + " rok";
                dT54.Text = (dateNow.Year - 3).ToString() + " rok";

                dT61.Text = Date2.Text;
                dT62.Text = (dateNow.Year - 1).ToString() + " rok";
                dT63.Text = (dateNow.Year - 2).ToString() + " rok";
                dT64.Text = (dateNow.Year - 3).ToString() + " rok";

                // czwarta zakladka

                dataLabelSR4.Text = "(od 1 stycznia " + (dateNow.Year - 3).ToString() + " do " + Date2.Text;
                dataLabelSR5.Text = "(od 1 stycznia " + (dateNow.Year - 3).ToString() + " do " + Date2.Text;
            }
            catch (Exception ex)
            { }

        }
        // zakladka 1
        #region zakladka 1
        protected void getTabData_z1s1(string idDzialu)
        {

            DataTable dT = new DataTable();

            dT = ccr.getTabData1("1", "1", "1", "1", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1":
                        {
                            z1s1w1k1.Text = dR[1].ToString().Trim();
                        }
                        break;
                    case "2":
                        {
                            z1s1w1k2.Text = dR[1].ToString().Trim();
                        }
                        break;
                    case "3":
                        {
                            z1s1w1k3.Text = dR[1].ToString().Trim();
                        }
                        break;
                    case "4":
                        {
                            z1s1w1k4.Text = dR[1].ToString().Trim();
                        }
                        break;
                    case "5":
                        {
                            z1s1w1k5.Text = dR[1].ToString().Trim();
                        }
                        break;

                    default:
                        break;
                }
            }

        }



        protected void getTabData_z1s2(string idDzialu)
        {
            DataTable dT = new DataTable();

            // forst row
            string idZakladki = "1";
            string idSekcji = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, "1", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s2w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s2w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s2w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s2w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s2w1k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 2
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, "2", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s2w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s2w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s2w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s2w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s2w2k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 3
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, "3", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s2w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s2w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s2w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s2w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s2w3k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }

        }


        protected void getTabData_z1s3(string idDzialu)
        {
            DataTable dT = new DataTable();

            // forst row
            dT = ccr.getTabData1(idDzialu, "1", "3", "1", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w1k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 2
            dT = ccr.getTabData1(idDzialu, "1", "3", "2", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w2k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 3
            dT = ccr.getTabData1(idDzialu, "1", "3", "3", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w3k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 4
            dT = ccr.getTabData1(idDzialu, "1", "3", "4", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w4k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wiersz 5

            dT = ccr.getTabData1(idDzialu, "1", "3", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w5k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w5k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w5k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w5k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w5k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wiersz 6
            dT = ccr.getTabData1(idDzialu, "1", "3", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w6k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w6k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w6k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w6k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w6k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wirsz7 do 7

            dT = ccr.getTabData1(idDzialu, "1", "3", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s3w7k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s3w7k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s3w7k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s3w7k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s3w7k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//dokonczyc do 7

        }

        protected void getTabData_z1s4(string idDzialu)
        {
            DataTable dT = new DataTable();

            // forst row
            dT = ccr.getTabData1(idDzialu, "1", "4", "1", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w1k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 2
            dT = ccr.getTabData1(idDzialu, "1", "4", "2", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w2k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 3
            dT = ccr.getTabData1(idDzialu, "1", "4", "3", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w3k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 4
            dT = ccr.getTabData1(idDzialu, "1", "4", "4", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w4k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wiersz 5

            dT = ccr.getTabData1(idDzialu, "1", "4", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w5k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w5k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w5k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w5k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w5k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wiersz 6
            dT = ccr.getTabData1(idDzialu, "1", "4", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w6k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w6k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w6k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w6k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w6k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//wirsz7 do 7

            dT = ccr.getTabData1(idDzialu, "1", "4", "5", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s4w7k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s4w7k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s4w7k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s4w7k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s4w7k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }//dokonczyc do 7

        }

        protected void getTabData_z1s5(string idDzialu)
        {
            DataTable dT = new DataTable();

            // forst row
            dT = ccr.getTabData1(idDzialu, "1", "5", "1", con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z1s5w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z1s5w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z1s5w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z1s5w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z1s5w1k5.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            //  row 2


        }

        #endregion

        //zakladka 2
        #region zakladka 2
        protected void getTabData_z2s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "2";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z2s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z2s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z2s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z2s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z2s1w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z2s1w1k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z2s1w1k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z2s1w1k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z2s1w1k9.Text = dR[1].ToString().Trim(); } break;


                    default:
                        break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z2s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z2s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z2s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z2s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z2s1w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z2s1w1k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z2s1w1k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z2s1w1k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z2s1w1k9.Text = dR[1].ToString().Trim(); } break;


                    default:
                        break;
                }
            }


        }
        #endregion

        //zakladka 3
        #region zakladka 3

        //sekcka 1
        protected void getTabData_z3s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s1w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s1w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s1w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s1w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s1w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s1w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s1w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s1w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s1w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s1w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s1w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s1w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s1w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1
          //sekcja 2
        protected void getTabData_z3s2(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s2w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s2w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s2w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s2w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s2w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s2w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s2w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s2w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s2w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s2w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s2w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s2w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s2w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s2w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s2w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s2w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s2w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s2w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s2w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s2w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s2w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s2w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s2w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s2w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1

        //sekcja 3
        protected void getTabData_z3s3(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s3w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s3w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s3w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s3w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s3w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s3w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s3w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s3w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s3w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s3w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s3w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s3w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s3w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s3w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s3w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s3w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s3w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s3w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s3w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s3w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s3w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s3w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s3w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1

        //sekcja 4
        protected void getTabData_z3s4(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s4w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s4w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s4w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s4w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s4w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s4w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s4w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s4w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s4w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s4w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s4w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s4w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s4w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s4w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s4w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s4w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s4w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s4w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s4w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s4w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s4w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s4w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s4w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s4w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1

        //sekcja 5
        protected void getTabData_z3s5(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s5w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s5w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s5w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s5w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s5w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s5w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s5w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s5w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s5w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s5w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s5w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s5w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s5w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s5w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s5w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s5w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s5w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s5w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s5w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s5w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s5w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s5w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s5w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s5w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1

        //sekcja 5
        protected void getTabData_z3s6(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "3";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s6w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s6w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s6w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s6w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s6w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s6w1k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s6w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s6w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s6w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s6w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s6w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s6w2k6.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s6w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s6w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s6w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s6w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s6w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s6w3k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z3s6w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z3s6w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z3s6w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z3s6w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z3s6w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z3s6w4k6.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z3s1
        #endregion

        //zakladka 4

        #region zakladka 4

        //sekcka 1
        protected void getTabData_z4s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s1w3k4.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s1w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s1w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s1w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s1w4k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z4s1
          //sekcja 2
        protected void getTabData_z4s2(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s2w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s2w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s2w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s2w1k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s2w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s2w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z4s2w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z4s2w2k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w3k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w4k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z4s1

        //sekcja 3
        protected void getTabData_z4s3(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "3";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s3w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s3w1k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s3w2k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s3w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s3w3k2.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }

        } // end of getTabData_z4s1

        //sekcja 4
        protected void getTabData_z4s4(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "4";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s4w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s4w1k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s4w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s4w2k2.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z4s4w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z4s4w3k2.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }

        } // end of getTabData_z4s

        #endregion

        // zakladka 5

        #region zakladka 5

        //sekcka 1
        protected void getTabData_z5s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "5";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s1w1k5.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s1w2k5.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s1w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s1w3k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

        } // end of getTabData_z5s1

        //sekcja 2
        protected void getTabData_z5s2(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "5";
            string idSekcji = "2";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w1k5.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w2k5.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w3k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w4k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            // ========================  wiersz 5  ==================================
            idWiersza = "5";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w5k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w5k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w5k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w5k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w5k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            // ========================  wiersz 6  ==================================
            idWiersza = "6";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w6k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w6k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w6k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w6k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w6k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            // ========================  wiersz 6  ==================================
            idWiersza = "7";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w7k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w7k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w7k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w7k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w7k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            // ========================  wiersz 8  ==================================
            idWiersza = "8";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w8k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w8k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w8k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w8k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w8k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            // ========================  wiersz 9  ==================================
            idWiersza = "9";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s2w9k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s2w9k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s2w9k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s2w9k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s2w9k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

        } // end of getTabData_z5s1

        //sekcja 3
        protected void getTabData_z5s3(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "5";
            string idSekcji = "3";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z5s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w2k5.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w3k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }
            //============== wiersz 4 ===========================
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w4k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            //============== wiersz 5 ===========================
            idWiersza = "5";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w5k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w5k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w5k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w5k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w5k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            //============== wiersz 6 ===========================
            idWiersza = "6";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w6k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w6k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w6k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w6k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w6k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            //============== wiersz 7 ===========================
            idWiersza = "7";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w7k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w7k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w7k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w7k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w7k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            //============== wiersz 8 ===========================
            idWiersza = "8";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w8k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w8k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w8k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w8k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w8k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }

            //============== wiersz 9 ===========================
            idWiersza = "9";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s3w9k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s3w9k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s3w9k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s3w9k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s3w9k5.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }


        } // end of getTabData_z5s1


        //sekcja 5
        protected void getTabData_z5s4(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "5";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z5s4w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z5s4w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z5s4w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z5s4w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z5s4w1k5.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
        } // end of getTabData_z5s4



        #endregion


        // zakladka 6

        #region zakladka 6

        //sekcka 1
        protected void getTabData_z6s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "6";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z6s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z6s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z6s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z6s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z6s1w1k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z6s1w1k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z6s1w1k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z6s1w1k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z6s1w1k9.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z6s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z6s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z6s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z6s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z6s1w2k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z6s1w2k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z6s1w2k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z6s1w2k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z6s1w2k9.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z6s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z6s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z6s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z6s1w3k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z6s1w3k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z6s1w3k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z6s1w3k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z6s1w3k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z6s1w3k9.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }

            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z6s1w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z6s1w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z6s1w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z6s1w4k4.Text = dR[1].ToString().Trim(); } break;
                    case "5": { z6s1w4k5.Text = dR[1].ToString().Trim(); } break;
                    case "6": { z6s1w4k6.Text = dR[1].ToString().Trim(); } break;
                    case "7": { z6s1w4k7.Text = dR[1].ToString().Trim(); } break;
                    case "8": { z6s1w4k8.Text = dR[1].ToString().Trim(); } break;
                    case "9": { z6s1w4k9.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }

            }
        } // end of getTabData_z5s1




        #endregion

        //zakładka 7
        #region zalkadka 7

        //sekcka 1
        protected void getTabData_z7s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s1w1k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s1w3k4.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s1w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s1w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s1w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s1w4k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z7s1
          //sekcja 2
        protected void getTabData_z7s2(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w1k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w2k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w3k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s2w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s2w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z7s2w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z7s2w4k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z7s1

        //sekcja 3
        protected void getTabData_z7s3(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "3";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s3w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s3w1k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s3w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s3w2k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s3w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s3w3k2.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }

        } // end of getTabData_z7s1

        //sekcja 4
        protected void getTabData_z7s4(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "4";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s4w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s4w1k2.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s4w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s4w2k2.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s4w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z7s4w3k2.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }

        } // end of getTabData_z7s

        protected void getTabData_z7s5(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "4";
            string idSekcji = "5";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s5w1k1.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z7s5w2k1.Text = dR[1].ToString().Trim(); } break;

                    default: break;
                }
            }


        } // end of getTabData_z7s


        #endregion

        //zakładka 7
        #region zalkadka 7

        //sekcka 1
        protected void getTabData_z8s1(string idDzialu)
        {
            DataTable dT = new DataTable();
            string idZakladki = "8";
            string idSekcji = "1";
            string idWiersza = "1";
            // iorst row
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z8s1w1k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z8s1w1k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z8s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z8s1w1k3.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            //  row 2
            idWiersza = "2";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z8s1w2k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z8s1w2k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z8s1w2k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z8s1w2k4.Text = dR[1].ToString().Trim(); } break;
                    default: break;
                }
            }
            idWiersza = "3";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z8s1w3k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z8s1w3k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z8s1w3k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z8s1w3k4.Text = dR[1].ToString().Trim(); } break;

                    default:
                        break;
                }
            }
            idWiersza = "4";
            dT = ccr.getTabData1(idDzialu, idZakladki, idSekcji, idWiersza, con_str, DateTime.Parse(Date1.Text), DateTime.Parse(Date2.Text), 1);
            foreach (DataRow dR in dT.Rows)
            {
                switch (dR[0].ToString().Trim())
                {
                    case "1": { z8s1w4k1.Text = dR[1].ToString().Trim(); } break;
                    case "2": { z8s1w4k2.Text = dR[1].ToString().Trim(); } break;
                    case "3": { z8s1w4k3.Text = dR[1].ToString().Trim(); } break;
                    case "4": { z8s1w4k4.Text = dR[1].ToString().Trim(); } break;
                    default:
                        break;
                }
            }
        } // end of getTabData_z7s1
          //sekcja 2


        #endregion


        // handling methods



        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //save to excell
            string path = Server.MapPath("Template") + "\\SSRocena1.xlsx";
            FileInfo existingFile = new FileInfo(path);


            string download = Server.MapPath("Template") + @"\SSRocena";

            FileInfo fNewFile = new FileInfo(download + ".xlsx");
            try
            {
                File.Delete(fNewFile.FullName);
            }
            catch (Exception ex)
            {
                //      Label31.Text = "Delete error massage: " + ex.Message + "<br/>";       
            }
            przemiel();
            using (ExcelPackage MyExcel = new ExcelPackage(existingFile))
            {
                ExcelWorksheet zakladka1 = MyExcel.Workbook.Worksheets[1];
                //daty
                zakladka1.Cells[3, 3].Value = dateLabel1.Text.Trim();
                zakladka1.Cells[3, 4].Value = dateLabel2.Text.Trim();
                zakladka1.Cells[3, 5].Value = dateLabel3.Text.Trim();
                zakladka1.Cells[3, 6].Value = "ssss";// dateLabel4.Text.Trim();

                //sekcja 1

                zakladka1.Cells[4, 3].Value = z1s1w1k1.Text;
                zakladka1.Cells[4, 4].Value = z1s1w1k2.Text;
                zakladka1.Cells[4, 5].Value = z1s1w1k3.Text;
                zakladka1.Cells[4, 6].Value = z1s1w1k4.Text;
                zakladka1.Cells[4, 7].Value = z1s1w1k5.Text;
                //sekcja 2
                #region sekcja 2 zakladak 1
                zakladka1.Cells[8, 3].Value = dateLabel1.Text.Trim();
                zakladka1.Cells[8, 4].Value = dateLabel2.Text.Trim();
                zakladka1.Cells[8, 5].Value = dateLabel3.Text.Trim();
                zakladka1.Cells[8, 6].Value = "ssss";// dateLabel4.Text.Trim();

                //liczby
                //wiersz 1
                zakladka1.Cells[9, 3].Value = z1s2w1k1.Text;
                zakladka1.Cells[9, 4].Value = z1s2w1k2.Text;
                zakladka1.Cells[9, 5].Value = z1s2w1k3.Text;
                zakladka1.Cells[9, 6].Value = z1s2w1k4.Text;
                zakladka1.Cells[9, 7].Value = z1s2w1k5.Text;

                //wiersz 2
                zakladka1.Cells[10, 3].Value = z1s2w2k1.Text;
                zakladka1.Cells[10, 4].Value = z1s2w2k2.Text;
                zakladka1.Cells[10, 5].Value = z1s2w2k3.Text;
                zakladka1.Cells[10, 6].Value = z1s2w2k4.Text;
                zakladka1.Cells[10, 7].Value = z1s2w2k5.Text;

                //wiersz 2
                zakladka1.Cells[11, 3].Value = z1s2w3k1.Text;
                zakladka1.Cells[11, 4].Value = z1s2w3k2.Text;
                zakladka1.Cells[11, 5].Value = z1s2w3k3.Text;
                zakladka1.Cells[11, 6].Value = z1s2w3k4.Text;
                zakladka1.Cells[11, 7].Value = z1s2w3k5.Text;
                #endregion

                //sekcja 3
                #region sekcja 3 zakladka 1
                //wiersz 1
                zakladka1.Cells[12, 3].Value = z1s3w1k1.Text;
                zakladka1.Cells[12, 4].Value = z1s3w1k2.Text;
                zakladka1.Cells[12, 5].Value = z1s3w1k3.Text;
                zakladka1.Cells[12, 6].Value = z1s3w1k4.Text;
                zakladka1.Cells[12, 7].Value = z1s3w1k5.Text;

                //wiersz 2
                zakladka1.Cells[13, 3].Value = z1s3w2k1.Text;
                zakladka1.Cells[13, 4].Value = z1s3w2k2.Text;
                zakladka1.Cells[13, 5].Value = z1s3w2k3.Text;
                zakladka1.Cells[13, 6].Value = z1s3w2k4.Text;
                zakladka1.Cells[13, 7].Value = z1s3w2k5.Text;

                //wiersz 3
                zakladka1.Cells[14, 3].Value = z1s3w3k1.Text;
                zakladka1.Cells[14, 4].Value = z1s3w3k2.Text;
                zakladka1.Cells[14, 5].Value = z1s3w3k3.Text;
                zakladka1.Cells[14, 6].Value = z1s3w3k4.Text;
                zakladka1.Cells[14, 7].Value = z1s3w3k5.Text;

                //wiersz 4
                zakladka1.Cells[15, 3].Value = z1s3w4k1.Text;
                zakladka1.Cells[15, 4].Value = z1s3w4k2.Text;
                zakladka1.Cells[15, 5].Value = z1s3w4k3.Text;
                zakladka1.Cells[15, 6].Value = z1s3w4k4.Text;
                zakladka1.Cells[15, 7].Value = z1s3w4k5.Text;

                //wiersz 5
                zakladka1.Cells[16, 3].Value = z1s3w5k1.Text;
                zakladka1.Cells[16, 4].Value = z1s3w5k2.Text;
                zakladka1.Cells[16, 5].Value = z1s3w5k3.Text;
                zakladka1.Cells[16, 6].Value = z1s3w5k4.Text;
                zakladka1.Cells[16, 7].Value = z1s3w5k5.Text;

                //wiersz 6
                zakladka1.Cells[17, 3].Value = z1s3w6k1.Text;
                zakladka1.Cells[17, 4].Value = z1s3w6k2.Text;
                zakladka1.Cells[17, 5].Value = z1s3w6k3.Text;
                zakladka1.Cells[17, 6].Value = z1s3w6k4.Text;
                zakladka1.Cells[17, 7].Value = z1s3w6k5.Text;

                //wiersz 7
                zakladka1.Cells[18, 3].Value = z1s3w7k1.Text;
                zakladka1.Cells[18, 4].Value = z1s3w7k2.Text;
                zakladka1.Cells[18, 5].Value = z1s3w7k3.Text;
                zakladka1.Cells[18, 6].Value = z1s3w7k4.Text;
                zakladka1.Cells[18, 7].Value = z1s3w7k5.Text;
                #endregion

                #region sekcja 4 zakladka 1
                //wiersz 1
                zakladka1.Cells[19, 3].Value = z1s4w1k1.Text;
                zakladka1.Cells[19, 4].Value = z1s4w1k2.Text;
                zakladka1.Cells[19, 5].Value = z1s4w1k3.Text;
                zakladka1.Cells[19, 6].Value = z1s4w1k4.Text;
                zakladka1.Cells[19, 7].Value = z1s4w1k5.Text;

                //wiersz 2
                zakladka1.Cells[20, 3].Value = z1s4w2k1.Text;
                zakladka1.Cells[20, 4].Value = z1s4w2k2.Text;
                zakladka1.Cells[20, 5].Value = z1s4w2k3.Text;
                zakladka1.Cells[20, 6].Value = z1s4w2k4.Text;
                zakladka1.Cells[20, 7].Value = z1s4w2k5.Text;

                //wiersz 3
                zakladka1.Cells[21, 3].Value = z1s4w3k1.Text;
                zakladka1.Cells[21, 4].Value = z1s4w3k2.Text;
                zakladka1.Cells[21, 5].Value = z1s4w3k3.Text;
                zakladka1.Cells[21, 6].Value = z1s4w3k4.Text;
                zakladka1.Cells[21, 7].Value = z1s4w3k5.Text;

                //wiersz 4
                zakladka1.Cells[22, 3].Value = z1s4w4k1.Text;
                zakladka1.Cells[22, 4].Value = z1s4w4k2.Text;
                zakladka1.Cells[22, 5].Value = z1s4w4k3.Text;
                zakladka1.Cells[22, 6].Value = z1s4w4k4.Text;
                zakladka1.Cells[22, 7].Value = z1s4w4k5.Text;

                //wiersz 5
                zakladka1.Cells[23, 3].Value = z1s4w5k1.Text;
                zakladka1.Cells[23, 4].Value = z1s4w5k2.Text;
                zakladka1.Cells[23, 5].Value = z1s4w5k3.Text;
                zakladka1.Cells[23, 6].Value = z1s4w5k4.Text;
                zakladka1.Cells[23, 7].Value = z1s4w5k5.Text;

                //wiersz 6
                zakladka1.Cells[24, 3].Value = z1s4w6k1.Text;
                zakladka1.Cells[24, 4].Value = z1s4w6k2.Text;
                zakladka1.Cells[24, 5].Value = z1s4w6k3.Text;
                zakladka1.Cells[24, 6].Value = z1s4w6k4.Text;
                zakladka1.Cells[24, 7].Value = z1s4w6k5.Text;

                //wiersz 7
                zakladka1.Cells[25, 3].Value = z1s4w7k1.Text;
                zakladka1.Cells[25, 4].Value = z1s4w7k2.Text;
                zakladka1.Cells[25, 5].Value = z1s4w7k3.Text;
                zakladka1.Cells[25, 6].Value = z1s4w7k4.Text;
                zakladka1.Cells[25, 7].Value = z1s4w7k5.Text;
                #endregion

                #region sekcja 5 zakladka 1
                //wiersz 1
                zakladka1.Cells[26, 3].Value = z1s5w1k1.Text;
                zakladka1.Cells[26, 4].Value = z1s5w1k2.Text;
                zakladka1.Cells[26, 5].Value = z1s5w1k3.Text;
                zakladka1.Cells[26, 6].Value = z1s5w1k4.Text;
                zakladka1.Cells[26, 7].Value = z1s5w1k5.Text;

                

                #endregion

                //Add additional info here
                try
                {
                    MyExcel.SaveAs(fNewFile);

                    this.Response.Clear();
                    this.Response.ContentType = "application/vnd.ms-excel";
                    this.Response.AddHeader("Content-Disposition", "attachment;filename=" + fNewFile.Name);
                    this.Response.WriteFile(fNewFile.FullName);
                    this.Response.End();

                }
                catch (Exception ex)
                {
                    //  Label31.Text = Label31.Text + "Save Error massage " + ex.Message + "<br/>";

                }
                try
                {
                    // System.Diagnostics.Process.Start(fNewFile.FullName.ToString());
                }
                catch (Exception ex)
                {

                    //    Label31.Text = Label31.Text + "Run Excell Error massage " + ex.Message;
                }

            }


        }


        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            Session["position"] = DropDownList1.SelectedIndex;
            przemiel();
        }

        protected void dateLabel4_DataBinding(object sender, EventArgs e)
        {

        }
    }
}
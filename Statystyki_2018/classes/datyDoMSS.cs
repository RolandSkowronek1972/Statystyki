/*
Last Update:
    - version 1.190105
Creation date: 2019-01-08

- DataDzisiejsza<='2018-01-31' to '2017-01-01' - '2017-12-31' - rok poprzedni
- DataDzisiejsza<='2018-04-30' to '2018-01-01' - '2018-03-31' - I kwartał
- DataDzisiejsza<='2018-07-31' to '2018-01-01' - '2018-06-30' - II kwartał
- DataDzisiejsza<='2018-10-31' to '2018-01-01' - '2018-09-30' - III kwartał
- DataDzisiejsza<='2019-01-31' to '2018-01-01' - '2018-12-31' - rok poprzedni
* */

using System;

namespace Statystyki_2018
{
    public class datyDoMSS
    {
        public string DataPoczatkowa()

        {
            string odpowiedz = string.Empty;
            var datadzisiejsza = DateTime.Now;
            odpowiedz = DateTime.Now.Month<4 ? (datadzisiejsza.Year - 1).ToString() + "-01-01" : datadzisiejsza.Year + "-01-01";
            return odpowiedz;
            /*
            var datadzisiejsza = DateTime.Now;
            switch (datadzisiejsza.Month)
            {
                case 1: return datadzisiejsza.Year - 1 + "-01-01";
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                default:
                    return datadzisiejsza.ToShortDateString();
            }*/
        }// end of DataPoczatkowa

        public string DataKoncowa()

        {
            var datadzisiejsza = DateTime.Now;
            switch (datadzisiejsza.Month)
            {
                case 1: return datadzisiejsza.Year - 1 + "-12-31";
                case 2: return datadzisiejsza.Year - 1 + "-12-31";
                case 3: return datadzisiejsza.Year - 1 + "-12-31";
                case 4: return datadzisiejsza.Year + "-03-31";
                case 5:
                case 6:
                case 7: return datadzisiejsza.Year + "-06-30";
                case 8:
                case 9:
                case 10: return datadzisiejsza.Year + "-09-30";
                case 11:
                case 12: return datadzisiejsza.Year + "-12-31";
                default:
                    return datadzisiejsza.ToShortDateString();
            }
        }// end of DataKoncowa
    }
}
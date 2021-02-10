using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{

    public class log_4_net
    {
        public log4net.ILog logx = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        public void Info(string Message,bool debug)
        {
            if (debug)
            {
                logx.Info(Message);

            }
        }
        public void Info(string Message)
        {
            try
            {
                AppSettingsReader app = new AppSettingsReader();
                if ((int)app.GetValue("logDebug", typeof(int)) != 1)
                {
                    return;
                }
                logx.Info(Message);
            }
            catch
            { }

        }

        public void Error(string Message)
        {
            try
            {
                AppSettingsReader app = new AppSettingsReader();
                if ((int)app.GetValue("logDebug", typeof(int)) != 1)
                {
                    return;
                }
                logx.Info(Message);
            }
            catch
            { }

        }

    } // end of class
}

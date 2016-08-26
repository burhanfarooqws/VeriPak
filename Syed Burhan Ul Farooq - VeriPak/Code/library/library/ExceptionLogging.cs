using System;
using System.IO;
using context = System.Web.HttpContext;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;

namespace library
{
    public static class ExceptionLogging
    {
        private static String exepurl;        
        public static void SendExcepToDB(Exception exdb)
        {
            libraryEntities db = new libraryEntities();
            exepurl = context.Current.Request.Url.ToString();
            db.ExceptionLoggingToDataBase(exdb.Message.ToString(), exdb.GetType().Name.ToString(), exepurl, exdb.StackTrace.ToString());            
        }        
    }
}
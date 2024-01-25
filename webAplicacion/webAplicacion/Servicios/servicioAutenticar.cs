﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Configuration;
using System.Web.Script.Serialization;
using webAplicacion.Servicios.Models;

namespace webAplicacion.Models
{
    public class servicioAutenticar
    {
        public static bool AlwaysGoodCertificate(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors policyErrors)
        {
            return true;
        }
        string urlapi = WebConfigurationManager.AppSettings["urlapi"].ToString();
        public usuarioLogin RecuperaToken(string plogin, string ppassword)
        {
            ServicePointManager.ServerCertificateValidationCallback += new
                RemoteCertificateValidationCallback(AlwaysGoodCertificate);
            usuarioLogin ousuarioLogin = new usuarioLogin();
            var request = (HttpWebRequest)WebRequest.Create(urlapi + "Control/CrearToken?login=" + plogin + "&password=" + ppassword);
            string json = JsonConvert.SerializeObject("");
            Resultado oResultado = new Resultado();
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Accept = "application/json";
            using (var streamWrite = new StreamWriter(request.GetRequestStream()))
            {
                streamWrite.Write(json);
                streamWrite.Flush();   
                streamWrite.Close();
            }
            JavaScriptSerializer j = new JavaScriptSerializer();
            try
            {
                using (WebResponse response = request.GetResponse())
                {
                    using (Stream strReader = response.GetResponseStream())
                    {
                        if (strReader == null) return ousuarioLogin;
                        using (StreamReader objReader = new StreamReader(strReader))
                        {
                            string responseBody = objReader.ReadToEnd();
                            try
                            {
                                responseBody = responseBody.Replace("{\"datoAdicional\":",
                                    responseBody = responseBody.Replace(",\"codigoResultado\":null,\"correcto\":true,\"notificacion\":null,\"" +
                                    "tiempoNotificacion\":null}", ""));
                                ousuarioLogin = j.Deserialize<usuarioLogin>(responseBody);
                            }
                            catch (Exception ex)
                            { }
                            return ousuarioLogin;
                        }
                    }
                }
            }
            catch (WebException ex)
            { }
            return ousuarioLogin;
        }
    }
}
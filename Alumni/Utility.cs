using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;

namespace Alumni
{
    public static class Utility
    {
        private const string SaltBegin = "__ALUMNI SNS BEGIN__";
        private const string SaltEnd = "__ALUMNI SNS END__";

        public static string SaltedMD5(string input)
        {
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            byte[] data = md5Hasher.ComputeHash(Encoding.UTF8.GetBytes(SaltBegin + input + SaltEnd));

            StringBuilder sb = new StringBuilder();
            foreach (var c in data)
                sb.Append(c.ToString("x2"));
            return sb.ToString();
        }

        public static string Truncate(string str, int length)
        {
            if (str.Length <= length)
                return str;
            else
                return str.Substring(0, length);
        }
    }
}
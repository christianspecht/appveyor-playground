using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;

namespace AppVeyorPlayground
{
    public class AppVeyorApi
    {
        public void Message1(string message)
        {
            var av = Environment.GetEnvironmentVariable("APPVEYOR");

            if (string.IsNullOrEmpty(av))
            {
                Console.WriteLine(message);
            }
            else
            {
                string cmd = string.Format("appveyor AddMessage \"{0}\"", message);
                Process.Start(cmd);
            }
        }
    }
}

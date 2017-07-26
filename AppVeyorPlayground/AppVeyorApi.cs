using System;
using System.Collections.Generic;
using System.Text;
using System.Diagnostics;
using System.Net.Http;

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
                using (var client = new HttpClient())
                {
                    string data =@"{""message"": ""This is a test message"",""category"": ""warning"", ""details"": ""Additional information for the message""}";

                    client.BaseAddress = new Uri(Environment.GetEnvironmentVariable("APPVEYOR_API_URL"));
                    var response = client.PostAsync("api/build/messages", new StringContent(data)).Result;
                }
            }
        }
    }
}

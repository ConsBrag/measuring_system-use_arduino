using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.IO.Ports;
using System.IO;
using System.Windows.Threading;

namespace Arduino
{
    public static class ReadCom
    {
        public static SerialPort CurrentSerial { get; private set; }

        /*
        public static InitSerialPort(string text, int baudRate)
        {
            CurrentSerial = new SerialPort();
            CurrentSerial.PortName = text;
            CurrentSerial.BaudRate = baudRate;
            CurrentSerial.Open();
        }
        */
    }
}

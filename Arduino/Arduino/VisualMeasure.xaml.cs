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
using System.Collections;
using SWF = System.Windows.Forms;
using System.Collections.Specialized;
using System.ComponentModel;


namespace Arduino
{
    /// <summary>
    /// Логика взаимодействия для VisualMeasure.xaml
    /// </summary>
    public partial class VisualMeasure : Window
    {
        private readonly SerialPort arduino;
        //SerialPort portNames = new SerialPort();
        SerialPort sp = new SerialPort();
        public VisualMeasure()
        {
            InitializeComponent();
            if (comportno.Text != null && comspeed.Text != null)
            {
                string NumPort = "COM1";
                string NumSpeed = "9600";
                int NumSpeedInt = Int32.Parse(NumSpeed);
                if (comportno.Text != null)
                {
                    arduino = new SerialPort((string)NumPort)
                    {
                        BaudRate = NumSpeedInt
                    };
                    arduino.Open();
                    arduino.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);
                }
            }
        }



        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Вернуться назад
            arduino.Close();
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Hide();

        }


        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox comboBox = (ComboBox)sender;
            ComboBoxItem selectedItem = (ComboBoxItem)comboBox.SelectedItem;
            MessageBox.Show(selectedItem.Content.ToString());
        }

         private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            //проверка соединения
            try
            {
                string NumPort = comportno.Text;
                string NumSpeed = comspeed.Text;
                String portName = comportno.Text;
                String baudRate = comspeed.Text;
                sp.PortName = portName;
                int id = Int32.Parse(baudRate);
                sp.BaudRate = id;
                //sp.Open();
                status.Text = "Соединение установлено";
                status.Foreground = Brushes.GreenYellow;
            }
            catch (Exception)
            {
                MessageBox.Show("Соединение не установленно, проверьте подключение к контроллеру");
            }
        }

        
        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            //Logs logs =  new Logs();
            //logs.Visibility = Visibility.Visible;
            //mainWindow.Show();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            griide.Visibility = Visibility.Visible;
            var margin = chart.Margin;
            margin.Left = 340;
            chart.Margin = margin;
            logsopen.Visibility = Visibility.Collapsed;
        }

        private void Button_Click_10(object sender, RoutedEventArgs e)
        {

            griide.Visibility = Visibility.Hidden;
            //VisualMeasure.Weigt -= ;
            var margin = chart.Margin;
            margin.Left = 20;
            chart.Margin = margin;
            logsopen.Visibility = Visibility.Visible;
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            SWF.SaveFileDialog saveDialog = new SWF.SaveFileDialog();
            saveDialog.AddExtension = true;
            saveDialog.Filter = "(*.txt)|*.txt|Все файлы (*.*)|*.* ";

            if (saveDialog.ShowDialog() == SWF.DialogResult.OK)
            {
                File.WriteAllLines(saveDialog.FileName, listbox1.Items.OfType<string>(), Encoding.UTF8);
            }
        }

        private void DataReceivedHandler(object sender, SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;
            string data = sp.ReadLine();

            listbox1.Dispatcher.Invoke(new Action(delegate
            {
                // Running on the UI thread
                listbox1.Items.Add(data);
                listbox1.SelectedIndex = listbox1.Items.Count + 1;
                listbox1.SelectedIndex = +1;
            }));

        }


        private void listbox1_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            
        }

        
        private void Window_Closing(object sender, CancelEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}

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
using System.Diagnostics;
using System.IO.Ports;
using System.IO;
using System.ComponentModel;

namespace Arduino
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>

        public partial class ConfigСontroller : Window
        {

        SerialPort portNames = new SerialPort();
        SerialPort sp = new SerialPort();
        public string ViewModel { get; set; }
            

            public ConfigСontroller()
            {
                InitializeComponent();
            }

            public void ShowViewModel()
            {
                MessageBox.Show(ViewModel);
            }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Установка драйверов
            //Process.Start("explorer.exe", @"C:\Users");
            Process.Start("https://www.arduino.cc/en/Guide/DriverInstallation");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Hide();
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

            //проверка соединения
            try
            {
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

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            //Загрузка прошивки
            Sketch sketch = new Sketch();
            sketch.Show();

        }


        private void NameArduino_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //Выбор контроллера
            ComboBox nameArduino = (ComboBox)sender;
            ComboBoxItem selectedItem = (ComboBoxItem)nameArduino.SelectedItem;
            //MessageBox.Show(selectedItem.Content.ToString());
        }

        private void comspeed_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //Выбор скорости БОД
            ComboBox comSpeed = (ComboBox)sender;
            ComboBoxItem selectedItem = (ComboBoxItem)comSpeed.SelectedItem;
            //MessageBox.Show(selectedItem.Content.ToString());
            //MessageBox.Show(selectedItem.Content.ToString());
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            Application.Current.Shutdown();
        }
    } 
}

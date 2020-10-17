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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Timers;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;

namespace Arduino
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Настроить контроллер
            this.Hide();
            ConfigСontroller configСontroller = new ConfigСontroller();
            configСontroller.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            //Перейти к замерам
            this.Hide();
            VisualMeasure visualMeasure = new VisualMeasure();
            visualMeasure.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            //Кнопка о программе
            AboutProgram aboutProgram = new AboutProgram();
            aboutProgram.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            //Кнопка помощи
            Process.Start("https://yadi.sk/d/pbeh-NXirB50pQ");
        }
        protected override void OnClosing(System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы действительно хотите закрыть", "",
                                                  MessageBoxButton.OKCancel);
            if (result == MessageBoxResult.Cancel)
            {
                e.Cancel = true;
            }
            base.OnClosing(e);
        }

        private void Window_Closing(object sender, CancelEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}

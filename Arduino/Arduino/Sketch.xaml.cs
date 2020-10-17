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
using System.Diagnostics;
using System.IO;

namespace Arduino
{
    /// <summary>
    /// Логика взаимодействия для Sketch.xaml
    /// </summary>
    public partial class Sketch : Window
    {
        

        //Process p = Process.Start(@"C:\Program Files (x86)\Arduino\arduino.exe");
        public Sketch()
        {
            InitializeComponent();
            //Отсюда берется код для контроллера
            tbInnerData.Text = File.ReadAllText(@"C:\Users\User\source\repos\Arduino\Arduino\Sketch1.txt");
        }

        private void Load_Click(object sender, RoutedEventArgs e)
        {
            //Загрузка скетча в контроллер. Открывается arduino
            Process p = Process.Start(@"C:\Program Files (x86)\Arduino\arduino.exe");
        }

        private void Close_CLick(object sender, RoutedEventArgs e)
        {
            //Закрытть приложение
            this.Close();
        }

        private void tbInnerData_TextChanged(object sender, TextChangedEventArgs e)
        {
            //При изменении текста сохраняется текущий текст и передается дальше
            //tbInnerData.Text = File.ReadAllText(@"c:\file1.txt");
        }
    }
}

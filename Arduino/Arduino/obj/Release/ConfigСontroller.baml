   M S B A M L   `   `   `  ���� B  >Arduino, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:ArduinoArduino  M ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089A-clr-namespace:System.IO.Ports;assembly=SystemSystem.IO.Ports     Arduino.ConfigСontroller   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Arduino     ?ports-clr-namespace:System.IO.Ports;assembly=System     -     � Title$/  )Настройка контроллера��$	��359��$	��421��$	��431��$	��359�� � WindowStartupLocation$ CenterScreen=�$	��431��$	��359�� � Icon$ LOGO.ico�� � 	Resources  S� 
ObjectType   System.IO.Ports.SerialPort S� 
MethodName   	portNames��%'   &	        S� "  $ GetPortNames��.��� $	��328�� J� RenderTransformOrigin$ 0.5,0.5&����	#FF1E1E1E.+��� -   $+��%Установка драйверов��$��241,272,0,0q�
���   �$��37��$	��158��$	��Top=�$
��Left=�$
��Bold"�$��14(��� -   $��button��$+��%Проверка соединения��$
��Left=�$��
241,17,0,0q�$	��Top=�$	��162��$��37��$ 0.5,0.5&�$
��Bold"�$��14(��� -   $'��!Загрузка прошивки��$��241,119,0,172q�$
��Auto��$	��162��$
��Left=�$
��Bold"�$��14(��� -   $!��Вернутся назад��$��
10,272,0,0q�$��37��$	��158��$	��Top=�$
��Left=�$
��Bold"�$��14(��� $
��Left=�$��68��$��	10,10,0,0q�$	��Top=�$	��158��.+��� 
�������$
��Bold"�$��14(����	#FF6E6565#!Выбор контроллера�� -    ��Name$ NameArduino��$��26��.@��� $��Arduino Uno���� $��Arduino Leonardo���� $��Arduino Mega���� $
��Left=�$	��113��$��	10,61,0,0q�$	��Top=�$	��158��.+��� 
�������$��14(�$
��Bold"����	#FF6E6565�� $
�COM-���� $�порт���� -   $ 	comportno��$��28������  �� Source# [  �� $��Скорость БОД��
�������$��14(�$
��Bold"����	#FF6E6565�� -   $ comspeed��$��28��.@��� $
��4800���� $
��9600���� $��14400���� $��19200���� $��28800���� $��38400���� $��57600���� $��115200���� -	   	 ��Name$	 status��$��Right=�$��	0,61,20,0q�$
��Wrap=�$6��0Соединение не установлено��$	��Top=�$��53��$	��143�����	#FFFF000C$��16(�$
��Bold"�
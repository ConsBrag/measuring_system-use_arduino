   M S B A M L   `   `   `  ���� B  >Arduino, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:ArduinoArduino  M ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089A-clr-namespace:System.IO.Ports;assembly=SystemSystem.IO.Ports !clr-namespace:ArduinoArduino      Arduino.VisualMeasure   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     'localclr-namespace:Arduino     ?ports-clr-namespace:System.IO.Ports;assembly=System     )exampleclr-namespace:Arduino     -     � Title$  Измерения��$	��600��$
��1280�� � WindowStartupLocation$ CenterScreen=�$��Stretch=� � Icon$ LOGO.ico��$	��600��$
��1280�� � 	Resources 6   0Arduino.CreateRealTimeTickingStockChartViewModel   	ViewModel S� 
ObjectType   System.IO.Ports.SerialPort S� 
MethodName  	portNames��%6   &	        &	        S� "  $ GetPortNames��.��� $	��519�� � ColumnDefinitions �� .+�� ���	#FF1C1C1E.+�� $��	343,0,0,0q�.+��� -   $!��Вернутся назад��$��252,0,537,8q�$	��120��$��30��$��Bottom=�$
��Bold"��� -    ��Name$ logsopen��$#��Показать журнал��$��
93,0,692,8q�$	��120��$��30��$��Bottom=�$
��Bold"�$y�	Collapsed=��� $	��100��$��93,13,738,0q�$	��Top=�$��90��.+��� -    ��Name$ 	comportno��$��30��$��90��	 �� 
IsEditable	 . 
 �� 
IsReadOnly
 . ���	#FF1C1D29$
��Bold"�����  �� Source# [ �� $	��100��$��298,13,533,0q�$	��Top=�$��90��.+��� -   $ comspeed��$��30��$��90��	 . 
 . $
��Bold"����	#FF1C1D29.@��� $
��4800���� $
��9600���� $��14400���� $��19200���� $��28800���� $��38400���� $��57600���� $��115200���� -    ��Name$ status��$��572,10,203,0q�$
��Wrap=�$	��Top=�
���  �� �� TextAlignment$ Center=�$
��Bold"�$��14(�$6��0Соединение не установлено��$��40��$	��136���� -   $+��%Проверка соединения��$��406,13,375,0q�$	��Top=�$	��140��$��30��$
��Bold"��� $��206,20,628,0q�$
��Wrap=�$��Скорость БОД��$
��Bold"�
�������$��16��$	��Top=�$��87���� $��24,20,835,0q�$
��Wrap=�$��COM-порт��$
��Bold"�
�������$��16��$	��Top=�$��65��� -    �Name$ griide��$��
10,0,952,0q����	#FF1C1C1E$y�Visible=�$
��Left=�.+��� -	   $%��Сохранить журнал��$��
10,0,170,8q�$��Bottom=�$	��120��$��30��$��Bottom=�$��Stretch=�$
��Bold"��� -
   $��← Закрыть��$��
169,0,13,8q�$��Bottom=�$	��120��$��30��$��Bottom=�$��Stretch=�$
��Bold"��� -    ��Name$ listbox1��$��	0,10,0,45q����	#FFF1F1F1-   'Arduino.CreateRealTimeTickingStockChart  -     Name$ chart�� � DataContext# [  $��340,64,14,45q�$
��Left=�
   M S B A M L   `   `   `  ����B  >Arduino, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:ArduinoArduino  5   	   M ISystem, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089A-clr-namespace:System.IO.Ports;assembly=SystemSystem.IO.Ports 5   	   !clr-namespace:ArduinoArduino  5	          Arduino.VisualMeasure   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Arduino     5   	   ?ports-clr-namespace:System.IO.Ports;assembly=System     5   	   )exampleclr-namespace:Arduino     5	      -   5          � Title$  Измерения��5
   	   $	��600��6   $
��1280��6(    � WindowStartupLocation$ CenterScreen=�65   $��Stretch=�6Z    � Icon$ LOGO.ico��6�   $	��600��6�   $
��1280��6�    � 	Resources 5      6   0Arduino.CreateRealTimeTickingStockChartViewModel   	ViewModel S� 
ObjectType   System.IO.Ports.SerialPort S� 
MethodName  	portNames��%\   &	        &	        5   
   6;   S� 5   
   "  6   $ GetPortNames��6D   6^   5      .��5      � $	��519��6    � ColumnDefinitions 5   
   �� 5      .+�5   
   � ���	#FF1C1C1E.+�5      � $��	343,0,0,0q�6   .+�5      �� -   5        $!��Вернутся назад��5      $��252,0,537,8q�62   $	��120��6G   $��30��6S   $��Bottom=�6t   $
��Bold"�6�   �� 5      -   5         ��Name$ logsopen��5      $#��Показать журнал��6+   $��
93,0,692,8q�6E   $	��120��6Y   $��30��6e   $��Bottom=�6q   $
��Bold"�6�   $y�	Collapsed=�6�   �� 5      $	��100��6   $��93,13,738,0q�6*   $	��Top=�6?   $��90��6W   .+�5      �� -   5         ��Name$ 	comportno��5      $��30��6l   $��90��6x   	 �� 
IsEditable	 . 
 �� 
IsReadOnly
 . ���	#FF1C1D29$
��Bold"�6�   ��62   ��  �� Source# [ 6�   5      �� 5      $	��100��6   $��298,13,533,0q�6+   $	��Top=�6A   $��90��6Y   .+�5      �� -   5        $ comspeed��5      $��30��61   $��90��6=   	 . 
 . $
��Bold"�6l   ���	#FF1C1D29.@�5       �� $
��4800��6'   �� 5!      $
��9600��6'   �� 5"      $��14400��6'   �� 5#      $��19200��6'   �� 5$      $��28800��6'   �� 5%      $��38400��6'   �� 5&      $��57600��6'   �� 5'      $��115200��6'   5(      5*      �� 5,      -   5         ��Name$ status��5,      $��572,10,203,0q�6-   $
��Wrap=�6C   $	��Top=�6W   
���  �� �� TextAlignment$ Center=�6�   $
��Bold"�6�   $��14(�6�   $6��0Соединение не установлено��6�   $��40��6�   $	��136��6�   �� 5-      -   5        $+��%Проверка соединения��5-      $��406,13,375,0q�67   $	��Top=�6M   $	��140��6e   $��30��6q   $
��Bold"�6�   �� 5.      $��206,20,628,0q�6   $
��Wrap=�62   $��Скорость БОД��6F   $
��Bold"�6Z   
�������$��16��6   $	��Top=�6�   $��87��6�   �� 5/      $��24,20,835,0q�6   $
��Wrap=�61   $��COM-порт��6E   $
��Bold"�6U   
�������$��16��6z   $	��Top=�6�   $��65��6�   50      � 52      -   5         �Name$ griide��52      $��
10,0,952,0q�6$   ���	#FF1C1C1E$y�Visible=�6P   $
��Left=�6e   .+�53      �� -	   5        $%��Сохранить журнал��53      $��
10,0,170,8q�64   $��Bottom=�6H   $	��120��6c   $��30��6o   $��Bottom=�6|   $��Stretch=�6�   $
��Bold"�6�   �� 54      -
   5        $��← Закрыть��54      $��
169,0,13,8q�6-   $��Bottom=�6A   $	��120��6\   $��30��6h   $��Bottom=�6�   $��Stretch=�6�   $
��Bold"�6�   �� 55      -   5         ��Name$ listbox1��55      $��	0,10,0,45q�6,   ���	#FFF1F1F16l   56      58      -   'Arduino.CreateRealTimeTickingStockChart  59   
   -   5          Name$ chart��59   2    � DataContext# [  6A   $��340,64,14,45q�6j   $
��Left=�6�   5;      5=      
   M S B A M L   `   `   `  ����  Arduino-    'Arduino.CreateRealTimeTickingStockChart   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      e aSciChart.Examples.ExternalDependencies, Version=5.2.0.11600, Culture=neutral, PublicKeyToken=nullDext:http://schemas.abtsoftware.co.uk/scichart/exampleExternals  5      Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      X TSciChart.Core, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823i eSciChart.Charting.DrawingTools, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823\ XSciChart.Charting, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823X	 TSciChart.Data, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823[
 WSciChart.Drawing, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e8239s)http://schemas.abtsoftware.co.uk/scichart    	 
 5        � 	Resources  5      O  ISciChart.Examples.ExternalDependencies.Common.DoubleToGridLengthConverter   DoubleToGridLengthConverter  LegendStyle �� 
TargetType5  /SciChart.Charting.ChartModifiers.LegendModifier �� Property �� Value��%�  &	        &	        5   
   6*   �� 5   
   "  6$   .�5      ��  � ��$ 5q�6'   �� 5       �@ LegendPlacement$ Inside=�60   �� 5       � ��$ Center=�64   �� 5       � ��$ Bottom=�62   �� 5       �@ Orientation$ 
Horizontal=�6,   �� 5       �@ ShowSeriesMarkers . 62   �� 5        �@ ShowVisibilityCheckboxes . 69   5      5      .��5      �   5   
     MajorGridLineStyle  MinorGridLineStyle  MajorTickLineStyle  MinorTickLineStyle��%�  &	       &	 J     &	 �     &	     �� 5       " ��6/   .�5!      ��  � ��
 �����6+   5"      �� 5#      " ��6/   .�5$      ��  � �� �	#FF5151516+   5%      �� 5&      " ��6/   .�5'      ��  � ��
 �����6+   �� 5(      
 �@��X2$ 10��6'   5)      �� 5*      " ��6/   .�5+      ��  � �� �	#FF5151516+   �� 5,      
 �@��X2$ 3��6'   5-      5.       � ColumnDefinitions 50   
   �� 51      $
��Auto �6   �� 52      $��* �6    � RowDefinitions 55   
   �� 56      $��* �6   �� 57      $
��Auto �6   .+�5:   
   �� ���	#FF232426���#323539$��0,0,2,0q�5<       K� ZIndex$
 9999��5=      ._�5?      ��  �� Orientation$ Vertical=�6   .+�5@      d� -   5         d�Name$ IsZoomEnabled��5@        ZoomButtonStyle#��[ 5A      	 ^� ToolTip$	 Toggle Rubber-Band Zoom��5B      @  :SciChart.Charting.Common.Extensions.ToggleButtonExtensions
   	GroupName$)
 #RealtimeTickingStockChart_Modifiers��5C      d� 5E      -   5        $ IsPanEnabled��5E       d� 	IsChecked$
 TrueY�5F        PanButtonStyle#��[ 5G      $	 Toggle Zoom-Pan��5H      $)
 #RealtimeTickingStockChart_Modifiers��5I      C  =SciChart.Examples.ExternalDependencies.Common.FlyoutSeparator  5K      d� 5M      $��4q�5N        PlayButtonStyle#��[ 5O      $)
 #RealtimeTickingStockChart_StartStop��5P      ��5M      �� *StartUpdatesCommand+5P      d� 5Q      $��4q�5R       	 PauseButtonStyle#��[	 5S      $)
 #RealtimeTickingStockChart_StartStop��5T      ��5Q      �� *StopUpdatesCommand+5T        5V      D  >SciChart.Examples.ExternalDependencies.Common.FlyoutMenuButton  5X      $
��CTRL��6'   $��0q�5Y   '    
 FlyoutMenuButtonStyle#��[
 5Z   '      PopupContent 5[      �� 5\      $	��150��6%   $ Vertical=�64   .+�5]      �� $H��BУправление элементами визуализации��6(     5^      �� 5`      $ ��Толщина линии:��6(   �� 5a      -   5         ��Name$ StrokeThicknesses��5a   '   $��4q�5b   '    �� SelectedIndex$ 1��5d   '   ��5c   '   �� *StrokeThicknesses+5d   '   �� 5f      $��Стиль:��6(   �� 5g      $��4q�6'   ��5h   '   �� *SeriesStyles+ �� SelectedItem 5i   '   �� *SelectedSeriesStyle+ �� Mode$ TwoWay=��� 5l      -   5         ��Name$ UseAntiAliasing��5l   '   $��4q�5m   '   $6��0Использовать сглаживание?��5n   '   $ FalseY�5o   '   5q      5s      5t      5u      8  2SciChart.Charting.Visuals.TradeChart.SciStockChart  5z   
   -   5          Name$ 
PriceChart��5z      $��1��5{         LegendStyle# [ 5~         IsPanEnabled 5|      ��  �� Source %  System.Windows.Markup.Reference     Name$ IsPanEnabled�� �� Path$ 	IsChecked�$ TwoWay=�   IsRubberBandZoomEnabled 5}      ��    $ IsZoomEnabled��$ 	IsChecked�$ TwoWay=�/  )SciChart.Charting.Visuals.SciChartSurface   RenderableSeries 5      =	  7SciChart.Charting.Common.MarkupExtensions.SeriesBinding	  *SeriesViewModels+  5�        BaseRenderableSeriesStyleE
  ?SciChart.Charting.Visuals.RenderableSeries.BaseRenderableSeries  	LineStyleI  CSciChart.Charting.Visuals.RenderableSeries.FastLineRenderableSeries  
LineStyle1  
LineStyle2��%�  &	       &	     &	 4    &	 M    �� 5�      " 
 6:   .�5�      ��  �@
 Stroke$	 Red��6/   �� 5�       �@
 AntiAliasing 65   ��    $ UseAntiAliasing��$ 	IsChecked��� 5�       �@
 StrokeThickness 68   ��    $ StrokeThicknesses��$ SelectedItem�5�      �� 5�      "  6*   .�5�      ��  �@
 Stroke$ Magenta��6/   �� 5�       �@
 AntiAliasing 65   ��    $ UseAntiAliasing��$ 	IsChecked��� 5�       �@
 StrokeThickness 68   ��    $ StrokeThicknesses��$ SelectedItem�5�      �� 5�      "  6+   .�5�      ��  �@
 Stroke$
 Lime��6/   �� 5�       �@
 AntiAliasing 65   ��    $ UseAntiAliasing��$ 	IsChecked��� 5�       �@
 StrokeThickness 68   ��    $ StrokeThicknesses��$ SelectedItem�5�      �� 5�      "  6+   .�5�      ��  �@
 Stroke$
 Blue��6/   �� 5�       �@
 AntiAliasing 65   ��    $ UseAntiAliasing��$ 	IsChecked��� 5�       �@
 StrokeThickness 68   ��    $ StrokeThicknesses��$ SelectedItem�5�      5�         
XAxisStyle 5�      �� 5�      9  3SciChart.Charting.Visuals.Axes.CategoryDateTimeAxis"  6   .�5�      �� -  'SciChart.Charting.Visuals.Axes.AxisCore �@ MajorGridLineStyle# [ 6;   �� 5�       �@ MinorGridLineStyle# [ 6;   �� 5�       �@ MajorTickLineStyle# [ 6;   �� 5�       �@ MinorTickLineStyle# [ 6;   �� 5�       �@ TickTextBrush
 �  ��66   �� 5�       �@ BarTimeFrame 65   �� *BarTimeFrame+$ OneWay=��� 5�       �@ DrawMinorGridLines . 6;   �� 5�       �@ DrawMajorBands . 67   �� 5�       �@ VisibleRange 65   �� *XVisibleRange+$ TwoWay=��� 5�       �@ GrowByK  ESciChart.Charting.Common.Databinding.StringToDoubleRangeTypeConverter$ 0, 0.1 6/   5�         
YAxisStyle 5�      �� 5�      0  *SciChart.Charting.Visuals.Axes.NumericAxis"  6   .�5�      ��  �@ MajorGridLineStyle# [ 6;   �� 5�       �@ MinorGridLineStyle# [ 6;   �� 5�       �@ MajorTickLineStyle# [ 6;   �� 5�       �@ MinorTickLineStyle# [ 6;   �� 5�       �@ DrawMinorGridLines . 6;   �� 5�       �@ DrawMajorBands . 67   �� 5�       �@ TickTextBrush
 � � �66   �� 5�       �@ 	AutoRange$ Always=�62   5�      5�      � 5�   
   $��1��6   $��1��5�      $��32��5�       5�      �� 5�      $��20 �6#   �� 5�      $��* �6#   �� 5�      ��6#   ��    $ Proxy��$ ActualWidthValue�$ OneWay=� �� 	Converter# [  �� 5�      $��15 �6#   .+�5�      L  FSciChart.Examples.ExternalDependencies.Helpers.ActualSizePropertyProxy  -   5          Name$ Proxy��5�   *      Element 69   ��    $ 
PriceChart��$ YAxis�0  *SciChart.Charting.Visuals.SciChartOverview  5�      $��1��6!      ParentSurface 5�   !   ��    $ 
PriceChart��$ OneWay=�    SelectedRange  5�   !   �� *XVisibleRange+$ TwoWay=�$  SciChart.Charting.ThemeManager!   Theme! 5�   !   �� " �� ElementName$" 
ThemeCombo��$ SelectedItem�5�      5�      5�      
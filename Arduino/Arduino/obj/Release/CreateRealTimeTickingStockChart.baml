   M S B A M L   `   `   `  ����   Arduino-    'Arduino.CreateRealTimeTickingStockChart   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     e aSciChart.Examples.ExternalDependencies, Version=5.2.0.11600, Culture=neutral, PublicKeyToken=nullDext:http://schemas.abtsoftware.co.uk/scichart/exampleExternals  Bi:http://schemas.microsoft.com/expression/2010/interactivity  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  X TSciChart.Core, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823i eSciChart.Charting.DrawingTools, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823\ XSciChart.Charting, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823X	 TSciChart.Data, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e823[
 WSciChart.Drawing, Version=5.4.0.12119, Culture=neutral, PublicKeyToken=b55dd9efe817e8239s)http://schemas.abtsoftware.co.uk/scichart    	 
   � 	Resources  O  ISciChart.Examples.ExternalDependencies.Common.DoubleToGridLengthConverter   DoubleToGridLengthConverter  LegendStyle �� 
TargetType5  /SciChart.Charting.ChartModifiers.LegendModifier �� Property �� Value��%  &	        &	        �� "  .���  � ��$ 5q���  �@ LegendPlacement$ Inside=���  � ��$ Center=���  � ��$ Bottom=���  �@ Orientation$ 
Horizontal=���  �@ ShowSeriesMarkers . ��   �@ ShowVisibilityCheckboxes . .���     MajorGridLineStyle  MinorGridLineStyle  MajorTickLineStyle  MinorTickLineStyle��%�   &	       &	 %     &	 P     &	 �     �� " ��.���  � ��
 ������� " ��.���  � �� �	#FF515151�� " ��.���  � ��
 ������� 
 �@��X2$ 10���� " ��.���  � �� �	#FF515151�� 
 �@��X2$ 3�� � ColumnDefinitions �� $
��Auto ��� $��* � � RowDefinitions �� $��* ��� $
��Auto �.+��� ���	#FF232426���#323539$��0,0,2,0q� K� ZIndex$
 9999��._���  �� Orientation$ Vertical=�.+�d� -    d�Name$ IsZoomEnabled��  ZoomButtonStyle#��[ 	 ^� ToolTip$	 Toggle Rubber-Band Zoom��@  :SciChart.Charting.Common.Extensions.ToggleButtonExtensions
   	GroupName$)
 #RealtimeTickingStockChart_Modifiers��d� -   $ IsPanEnabled�� d� 	IsChecked$
 TrueY�  PanButtonStyle#��[ $	 Toggle Zoom-Pan��$)
 #RealtimeTickingStockChart_Modifiers��C  =SciChart.Examples.ExternalDependencies.Common.FlyoutSeparator  d� $��4q�  PlayButtonStyle#��[ $)
 #RealtimeTickingStockChart_StartStop������ *StartUpdatesCommand+d� $��4q� 	 PauseButtonStyle#��[	 $)
 #RealtimeTickingStockChart_StartStop������ *StopUpdatesCommand+  D  >SciChart.Examples.ExternalDependencies.Common.FlyoutMenuButton  $
��CTRL��$��0q� 
 FlyoutMenuButtonStyle#��[
    PopupContent �� $	��150��$ Vertical=�.+��� $H��BУправление элементами визуализации��  �� $ ��Толщина линии:���� -    ��Name$ StrokeThicknesses��$��4q� �� SelectedIndex$ 1������ *StrokeThicknesses+�� $��Стиль:���� $��4q����� *SeriesStyles+ �� SelectedItem �� *SelectedSeriesStyle+ �� Mode$ TwoWay=��� -    ��Name$ UseAntiAliasing��$��4q�$6��0Использовать сглаживание?��$ FalseY�8  2SciChart.Charting.Visuals.TradeChart.SciStockChart  -     Name$ 
PriceChart��$��1��   LegendStyle# [    IsPanEnabled ��  �� Source %  System.Windows.Markup.Reference     Name$ IsPanEnabled�� �� Path$ 	IsChecked�$ TwoWay=�   IsRubberBandZoomEnabled ��    $ IsZoomEnabled��$ 	IsChecked�$ TwoWay=�/  )SciChart.Charting.Visuals.SciChartSurface   RenderableSeries =	  7SciChart.Charting.Common.MarkupExtensions.SeriesBinding	  *SeriesViewModels+    BaseRenderableSeriesStyleE
  ?SciChart.Charting.Visuals.RenderableSeries.BaseRenderableSeries  	LineStyleI  CSciChart.Charting.Visuals.RenderableSeries.FastLineRenderableSeries  
LineStyle1  
LineStyle2��%�  &	       &	 �     &	 �    &	 �    �� " 
 .���  �@
 Stroke$	 Red����  �@
 AntiAliasing ��    $ UseAntiAliasing��$ 	IsChecked���  �@
 StrokeThickness ��    $ StrokeThicknesses��$ SelectedItem��� "  .���  �@
 Stroke$ Magenta����  �@
 AntiAliasing ��    $ UseAntiAliasing��$ 	IsChecked���  �@
 StrokeThickness ��    $ StrokeThicknesses��$ SelectedItem��� "  .���  �@
 Stroke$
 Lime����  �@
 AntiAliasing ��    $ UseAntiAliasing��$ 	IsChecked���  �@
 StrokeThickness ��    $ StrokeThicknesses��$ SelectedItem��� "  .���  �@
 Stroke$ 	#FFFFF300����  �@
 AntiAliasing ��    $ UseAntiAliasing��$ 	IsChecked���  �@
 StrokeThickness ��    $ StrokeThicknesses��$ SelectedItem�   
XAxisStyle �� 9  3SciChart.Charting.Visuals.Axes.CategoryDateTimeAxis"  .��� -  'SciChart.Charting.Visuals.Axes.AxisCore �@ MajorGridLineStyle# [ ��  �@ MinorGridLineStyle# [ ��  �@ MajorTickLineStyle# [ ��  �@ MinorTickLineStyle# [ ��  �@ TickTextBrush
 �  ����  �@ BarTimeFrame �� *BarTimeFrame+$ OneWay=���  �@ DrawMinorGridLines . ��  �@ DrawMajorBands . ��  �@ VisibleRange �� *XVisibleRange+$ TwoWay=���  �@ GrowByK  ESciChart.Charting.Common.Databinding.StringToDoubleRangeTypeConverter$ 0, 0.1    
YAxisStyle �� 0  *SciChart.Charting.Visuals.Axes.NumericAxis"  .���  �@ MajorGridLineStyle# [ ��  �@ MinorGridLineStyle# [ ��  �@ MajorTickLineStyle# [ ��  �@ MinorTickLineStyle# [ ��  �@ DrawMinorGridLines . ��  �@ DrawMajorBands . ��  �@ TickTextBrush
 � � ���  �@ 	AutoRange$ Always=�� $��1��$��1��$��32�� �� $��20 ��� $��* ��� ����    $ Proxy��$ ActualWidthValue�$ OneWay=� �� 	Converter# [  �� $��15 �.+�L  FSciChart.Examples.ExternalDependencies.Helpers.ActualSizePropertyProxy  -     Name$ Proxy��   Element ��    $ 
PriceChart��$ YAxis�0  *SciChart.Charting.Visuals.SciChartOverview  $��1��   ParentSurface ��    $ 
PriceChart��$ OneWay=�    SelectedRange  �� *XVisibleRange+$ TwoWay=�$  SciChart.Charting.ThemeManager!   Theme! �� " �� ElementName$" 
ThemeCombo��$ SelectedItem�
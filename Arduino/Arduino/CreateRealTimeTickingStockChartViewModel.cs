using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;
using SciChart.Charting.Common.Helpers;
using SciChart.Charting.Model.ChartSeries;
using SciChart.Charting.Model.DataSeries;
using SciChart.Data.Model;
using SciChart.Examples.ExternalDependencies.Common;
using SciChart.Examples.ExternalDependencies.Data;
using System.Timers;


namespace Arduino
{
    public class CreateRealTimeTickingStockChartViewModel : BaseViewModel
    {
        private readonly IMarketDataService _marketDataService;
        private readonly double _barTimeFrame = TimeSpan.FromSeconds(1).TotalSeconds; //Время обновления 
        private IndicatorBar _lastindicator; //
        private IndexRange _xVisibleRange;
        private string _selectedSeriesStyle;
        private ObservableCollection<IRenderableSeriesViewModel> _seriesViewModels;
        
        public CreateRealTimeTickingStockChartViewModel()
        {
            _seriesViewModels = new ObservableCollection<IRenderableSeriesViewModel>();

            DateTime localDate = DateTime.Now; //Начальное время

            //Загрузка данных которые хранятся в памяти
            _marketDataService = new MarketDataService(localDate, 1, 1); //Время и период изменения 

            //Добавление модели для представления графиков
            var ds0 = new XyDataSeries<DateTime, double> { SeriesName = "Температура (*С)" }; 
            _seriesViewModels.Add(new LineRenderableSeriesViewModel { DataSeries = ds0, StyleKey = "LineStyle" });
            
            //Добавление модели для представления графиков
            var ds1 = new XyDataSeries<DateTime, double> { SeriesName = "Давление (hPa)" };
            _seriesViewModels.Add(new LineRenderableSeriesViewModel { DataSeries = ds1, StyleKey = "LineStyle1" });

            //Добавление модели для представления графиков
            var ds2 = new XyDataSeries<DateTime, double> { SeriesName = "Высота (м)" };
            _seriesViewModels.Add(new LineRenderableSeriesViewModel { DataSeries = ds2, StyleKey = "LineStyle2" });

            //Добавление модели для представления графиков
            var ds3 = new XyDataSeries<DateTime, double> { SeriesName = "Влажность (%)" };
            _seriesViewModels.Add(new LineRenderableSeriesViewModel { DataSeries = ds3, StyleKey = "LineStyle" });

            double y0 = 0;
            double y1 = 0;
            double y2 = 0;
            double y3 = 0;

            var indicators = _marketDataService.GetHistoricalData(0); //начальное значение (история)

            ds0.Append(localDate, y0);
            ds1.Append(localDate, y1);
            ds2.Append(localDate, y2);
            ds3.Append(localDate, y3);

            SelectedSeriesStyle = "Line";
        }

        public ObservableCollection<IRenderableSeriesViewModel> SeriesViewModels
        {
            get { return _seriesViewModels; }
            set
            {
                _seriesViewModels = value;
                OnPropertyChanged("SeriesViewModels");
            }
        }

        public double BarTimeFrame { get { return _barTimeFrame; } } //Временная решетка

        public ICommand TickCommand
        {
            get { return new ActionCommand(() => OnNewIndicator(_marketDataService.GetNextBar())); }
        }

        public ICommand StartUpdatesCommand { get { return new ActionCommand(() => _marketDataService.SubscribeIndicatorUpdate(OnNewIndicator)); } } //Команда запуска отображения информации с датчиков

        public ICommand StopUpdatesCommand { get { return new ActionCommand(() => _marketDataService.ClearSubscriptions()); } } //Команда отмены отображения информации с датчиков

        public IEnumerable<string> SeriesStyles { get { return new[] {"Line", "Mountain" }; } } //Выбор стиля графика отображаемой информации

        public IEnumerable<int> StrokeThicknesses { get { return new[] { 1, 2, 3, 4, 5 }; } } //Выбор толщины линии графика

        public string SelectedSeriesStyle //Выбор стиля графика
        {
            get { return _selectedSeriesStyle; }
            set
            {
                _selectedSeriesStyle = value;
                OnPropertyChanged("SelectedSeriesStyle");

                if (_selectedSeriesStyle == "Line")
                {
                    SeriesViewModels[0] = new LineRenderableSeriesViewModel
                    {
                        DataSeries = SeriesViewModels[0].DataSeries,
                        StyleKey = "BaseRenderableSeriesStyle"
                    };
                }
                else if (_selectedSeriesStyle == "Mountain")
                {
                    SeriesViewModels[0] = new MountainRenderableSeriesViewModel
                    {
                        DataSeries = SeriesViewModels[0].DataSeries,
                        StyleKey = "BaseRenderableSeriesStyle"
                    };
                }
            }
        }

        public IndexRange XVisibleRange
        {
            get { return _xVisibleRange; }
            set
            {
                if (Equals(_xVisibleRange, value))
                    return;
                _xVisibleRange = value;
                OnPropertyChanged("XVisibleRange");
            }
        }

        private void OnNewIndicator(IndicatorBar indicator) //Следующий точка графика
        {
            double y0, y1, y2, y3;
            double y00, y10, y20, y30;
            DateTime localDate = DateTime.Now;
            Random rng = new Random();
            y0 = 0.5 - rng.NextDouble();
            y00 = 27.74 + y0;

            Random rng0 = new Random();
            y1 = 0.5 - rng0.NextDouble();
            y10 = 1008.33 + y1;

            Random rng1 = new Random();
            y2 = 0.5 - rng1.NextDouble();
            y20 = 41.06 + y2;

            Random rng2 = new Random();
            y3 = 0.5 - rng2.NextDouble();
            y30 = 57.77 + y3;

            // Убедитесь, что одновременно с многопоточным таймером обрабатывается только одно обновление
            lock (this)
            {

                // Добавление или обновление точки графика? 
                var ds0 = (IXyDataSeries<DateTime, double>)_seriesViewModels[0].DataSeries; //Температура
                var ds1 = (IXyDataSeries<DateTime, double>)_seriesViewModels[1].DataSeries; //Давление 
                var ds2 = (IXyDataSeries<DateTime, double>)_seriesViewModels[2].DataSeries; //Приблизительная высота
                var ds3 = (IXyDataSeries<DateTime, double>)_seriesViewModels[3].DataSeries; //Влажность

                if (_lastindicator != null && _lastindicator.DateTime == indicator.DateTime)
                {
                    ds0.Update(localDate, y00);
                    ds1.Update(localDate, y10);
                    ds2.Update(localDate, y20);
                    ds3.Update(localDate, y30);
                }
                else
                {
                    ds0.Append(localDate, y00);
                    ds1.Append(localDate, y10);
                    ds2.Append(localDate, y20);
                    ds3.Append(localDate, y30);

                    if (XVisibleRange.Max > ds0.Count)
                    {
                        var existingRange = _xVisibleRange;
                        var newRange = new IndexRange(existingRange.Min + 1, existingRange.Max + 1);
                        XVisibleRange = newRange;
                    }
                }

                _lastindicator = indicator;
            }
        }
    }
}

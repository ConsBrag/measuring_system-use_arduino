using System;
using System.Timers;

namespace Arduino
{
    public class RandomIndicatorsDataSource
    {
        private sealed class IndicatorBarInfo
        {
            public DateTime DateTime;
            public double Close;
        }

        private const double Frequency = 1.1574074074074073E-05;
        private readonly Random _random;
        private readonly int _candleIntervalMinutes;
        private readonly bool _simulateDateGap;
        private readonly Timer _timer;
        private IndicatorBar _lastIndicatorBar;
        private readonly IndicatorBarInfo _initialIndicatorBar;
        private double _currentTime;
        private readonly int _updatesPerPrice;
        private int _currentUpdateCount;
        private readonly TimeSpan _openMarketTime = new TimeSpan(0, 08, 0, 0);
        private readonly TimeSpan _closeMarketTime = new TimeSpan(0, 16, 30, 0);
        public event OnNewData NewData;
        public event OnUpdateData UpdateData;

        public RandomIndicatorsDataSource(int candleIntervalMinutes, bool simulateDateGap, double timerInterval, int updatesPerPrice, int randomSeed, double startingPrice, DateTime startDate)
        {
            _candleIntervalMinutes = candleIntervalMinutes;
            _simulateDateGap = simulateDateGap;
            _updatesPerPrice = updatesPerPrice;

            _timer = new Timer(timerInterval)
            {
                Enabled = false,
                AutoReset = true,
            };
            _timer.Elapsed += TimerElapsed;
            _initialIndicatorBar = new IndicatorBarInfo
            {
                Close = startingPrice,
                DateTime = startDate
            };
            _lastIndicatorBar = new IndicatorBar(_initialIndicatorBar.DateTime, _initialIndicatorBar.Close, _initialIndicatorBar.Close, _initialIndicatorBar.Close, _initialIndicatorBar.Close, 0L);
            _random = new Random(randomSeed);
        }

        public bool IsRunning
        {
            get { return _timer.Enabled; }
        }

        public void StartGenerateIndicatorBars()
        {
            _timer.Enabled = true;
        }

        public void StopGenerateIndicatorBars()
        {
            _timer.Enabled = false;
        }

        public IndicatorBar GetNextData()
        {
            IndicatorBar nextRandomPriceBar = GetNextRandomPriceBar();
            return nextRandomPriceBar;
        }

        private IndicatorBar GetNextRandomPriceBar()
        {
            double close = _lastIndicatorBar.Close;
            double num = (_random.NextDouble() - 0.9) * _initialIndicatorBar.Close / 30.0;
            double num2 = _random.NextDouble();
            double num3 = _initialIndicatorBar.Close + _initialIndicatorBar.Close / 2.0 * Math.Sin(7.27220521664304E-06 * _currentTime) + _initialIndicatorBar.Close / 16.0 * Math.Cos(7.27220521664304E-05 * _currentTime) + _initialIndicatorBar.Close / 32.0 * Math.Sin(7.27220521664304E-05 * (10.0 + num2) * _currentTime) + _initialIndicatorBar.Close / 64.0 * Math.Cos(7.27220521664304E-05 * (20.0 + num2) * _currentTime) + num;
            double num4 = Math.Max(close, num3);
            double num5 = _random.NextDouble() * _initialIndicatorBar.Close / 100.0;
            double high = num4 + num5;
            double num6 = Math.Min(close, num3);
            double num7 = _random.NextDouble() * _initialIndicatorBar.Close / 100.0;
            double low = num6 - num7;
            long volume = (long)(_random.NextDouble() * 30000 + 20000);
            DateTime openTime = _simulateDateGap ? EmulateDateGap(_lastIndicatorBar.DateTime) : _lastIndicatorBar.DateTime;
            DateTime closeTime = openTime.AddMinutes(_candleIntervalMinutes);
            IndicatorBar candle = new IndicatorBar(closeTime, close, high, low, num3, volume);
            _lastIndicatorBar = new IndicatorBar(candle.DateTime, candle.Open, candle.High, candle.Low, candle.Close, volume);
            _currentTime += _candleIntervalMinutes * 60;
            return candle;
        }

        private DateTime EmulateDateGap(DateTime candleOpenTime)
        {
            DateTime result = candleOpenTime;
            TimeSpan timeOfDay = candleOpenTime.TimeOfDay;
            if (timeOfDay > _closeMarketTime)
            {
                DateTime dateTime = candleOpenTime.Date;
                dateTime = dateTime.AddDays(1.0);
                result = dateTime.Add(_openMarketTime);
            }
            while (result.DayOfWeek == DayOfWeek.Saturday || result.DayOfWeek == DayOfWeek.Sunday)
            {
                result = result.AddDays(1.0);
            }
            return result;
        }

#if SILVERLIGHT

        private void TimerElapsed(object sender, EventArgs e)
        {
            OnTimerElapsed();
        }

#else

        private void TimerElapsed(object sender, ElapsedEventArgs e)
        {
            OnTimerElapsed();
        }

#endif

        private void OnTimerElapsed()
        {
            if (_currentUpdateCount < _updatesPerPrice)
            {
                _currentUpdateCount++;
                IndicatorBar updatedData = GetUpdatedData();
                if (UpdateData != null)
                {
                    UpdateData(updatedData);
                }
            }
            else
            {
                _currentUpdateCount = 0;
                IndicatorBar nextData = GetNextData();
                if (NewData != null)
                {
                    NewData(nextData);
                }
            }
        }

        private IndicatorBar GetUpdatedData()
        {
            double num = _lastIndicatorBar.Close + ((_random.NextDouble() - 0.48) * (_lastIndicatorBar.Close / 100.0));
            double high = (num > _lastIndicatorBar.High) ? num : _lastIndicatorBar.High;
            double low = (num < _lastIndicatorBar.Low) ? num : _lastIndicatorBar.Low;
            long volumeInc = (long)((_random.NextDouble() * 30000 + 20000) * 0.05);
            _lastIndicatorBar = new IndicatorBar(_lastIndicatorBar.DateTime, _lastIndicatorBar.Open, high, low, num, _lastIndicatorBar.Volume + volumeInc);

            return _lastIndicatorBar;
        }

        public void ClearEventHandlers()
        {
            NewData = null;
            UpdateData = null;
        }

        public IndicatorBar Tick()
        {
            if (_currentUpdateCount < _updatesPerPrice)
            {
                _currentUpdateCount++;
                return GetUpdatedData();
            }
            else
            {
                _currentUpdateCount = 0;
                return GetNextData();
            }
        }
    }
}
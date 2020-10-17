using System;
using System.Collections.Generic;

namespace Arduino
{
    public interface IMarketDataService
    {
        void SubscribeIndicatorUpdate(Action<IndicatorBar> callback);
        IEnumerable<IndicatorBar> GetHistoricalData(int numberBars);
        void ClearSubscriptions();
        IndicatorBar GetNextBar();
    }

    public delegate void OnNewData(IndicatorBar data);
    public delegate void OnUpdateData(IndicatorBar data);

    public class MarketDataService : IMarketDataService
    {
        private readonly DateTime _startDate;
        private readonly int _timeFrameMinutes;
        private readonly int _tickTimerIntervalms;
        private readonly RandomIndicatorsDataSource _generator;

        public MarketDataService(DateTime startDate, int timeFrameMinutes, int tickTimerIntervalms)
        {
            _startDate = startDate;
            _timeFrameMinutes = timeFrameMinutes;
            _tickTimerIntervalms = tickTimerIntervalms;
            _generator = new RandomIndicatorsDataSource(_timeFrameMinutes, true, _tickTimerIntervalms, 25, 367367, 30, _startDate);
        }

        public void SubscribeIndicatorUpdate(Action<IndicatorBar> callback)
        {
            if (!_generator.IsRunning)
            {
                _generator.NewData += (arg) => callback(arg);
                _generator.UpdateData += (arg) => callback(arg);

                _generator.StartGenerateIndicatorBars();
            }
        }

        public IEnumerable<IndicatorBar> GetHistoricalData(int numberBars)
        {
            List<IndicatorBar> indicators = new List<IndicatorBar>(numberBars);
            for (int i = 0; i < numberBars; i++)
            {
                indicators.Add(_generator.GetNextData());
            }

            return indicators;
        }

        public void ClearSubscriptions()
        {
            if (_generator.IsRunning)
            {
                _generator.StopGenerateIndicatorBars();
                _generator.ClearEventHandlers();
            }
        }

        public IndicatorBar GetNextBar()
        {
            return _generator.Tick();
        }
    }
}
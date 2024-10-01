import 'package:mental_healing/import.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          title: ChartTitle(
              text: LocaleKeys.mood_statistics.tr,
              alignment: ChartAlignment.near),
          primaryXAxis: const CategoryAxis(),
          primaryYAxis: const NumericAxis(),
          series: <CartesianSeries>[
            ColumnSeries<MoodData, String>(
              dataSource: getChartData(),
              xValueMapper: (MoodData data, _) => data.day,
              yValueMapper: (MoodData data, _) => data.moodLevel,
              pointColorMapper: (MoodData data, _) => data.color,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ],
        ),
      ),
    );
  }

  List<MoodData> getChartData() {
    return [
      MoodData('Mon', 1, Colors.brown),
      MoodData('Tue', 2, Colors.grey),
      MoodData('Wed', 3, Colors.orange),
      MoodData('Thu', 4, Colors.green),
      MoodData('Fri', 5, Colors.red),
      MoodData('Sat', 2, Colors.grey),
      MoodData('Sun', 1, Colors.grey),
    ];
  }
}

class MoodData {
  MoodData(this.day, this.moodLevel, this.color);

  final String day;
  final double moodLevel;
  final Color color;
}

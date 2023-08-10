library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_lints/lints/cyclomatic_complexity/cyclomatic_complexity_metric.dart';
import 'package:solid_lints/lints/cyclomatic_complexity/models/cyclomatic_complexity_parameters.dart';
import 'package:solid_lints/lints/lines_of_code/lines_of_code_metric.dart';
import 'package:solid_lints/lints/lines_of_code/models/lines_of_code_parameters.dart';
import 'package:solid_lints/lints/number_of_parameters/models/number_of_parameters_parameters.dart';
import 'package:solid_lints/lints/number_of_parameters/number_of_parameters_metric.dart';
import 'package:solid_lints/models/metric_rule.dart';

/// creates plugin
PluginBase createPlugin() => _SolidLints();

/// Solid metric linter
class _SolidLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    final List<LintRule> rules = [];

    final cyclomaticComplexity = MetricRule<CyclomaticComplexityParameters>(
      configs: configs,
      name: CyclomaticComplexityMetric.lintName,
      factory: CyclomaticComplexityParameters.fromJson,
      problemMessage: (value) => ''
          'The maximum allowed complexity of a function is '
          '${value.maxComplexity}. Please decrease it.',
    );

    if (cyclomaticComplexity.enabled) {
      rules.add(CyclomaticComplexityMetric(cyclomaticComplexity));
    }

    final numberOfParameters = MetricRule<NumberOfParametersParameters>(
      configs: configs,
      name: NumberOfParametersMetric.lintName,
      factory: NumberOfParametersParameters.fromJson,
      problemMessage: (value) => ''
          'The maximum allowed number of parameters is ${value.maxParameters}. '
          'Try reducing the number of parameters.',
    );

    if (numberOfParameters.enabled) {
      rules.add(NumberOfParametersMetric(numberOfParameters));
    }

    final linesOfCode = MetricRule<LinesOfCodeParameters>(
      configs: configs,
      name: LinesOfCodeMetric.lintName,
      factory: LinesOfCodeParameters.fromJson,
      problemMessage: (value) => ''
          'The maximum allowed number of lines is ${value.maxLines}. '
          'Try splitting the code into multiple files.',
    );

    if (linesOfCode.enabled) {
      rules.add(LinesOfCodeMetric(linesOfCode));
    }

    return rules;
  }
}

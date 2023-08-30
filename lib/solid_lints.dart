library solid_metrics;

import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_lints/lints/avoid_global_state/avoid_global_state_rule.dart';
import 'package:solid_lints/lints/avoid_late_keyword/avoid_late_keyword_rule.dart';
import 'package:solid_lints/lints/avoid_non_null_assertion/avoid_non_null_assertion_rule.dart';
import 'package:solid_lints/lints/avoid_returning_widgets/avoid_returning_widgets_rule.dart';
import 'package:solid_lints/lints/cyclomatic_complexity/cyclomatic_complexity_metric.dart';
import 'package:solid_lints/lints/double_literal_format/double_literal_format_rule.dart';
import 'package:solid_lints/lints/function_lines_of_code/function_lines_of_code_metric.dart';
import 'package:solid_lints/lints/number_of_parameters/number_of_parameters_metric.dart';
import 'package:solid_lints/models/solid_lint_rule.dart';

/// Creates a plugin for our custom linter
PluginBase createPlugin() => _SolidLints();

/// Initialize custom solid lints
class _SolidLints extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    final List<SolidLintRule> supportedRules = [
      CyclomaticComplexityMetric.createRule(configs),
      NumberOfParametersMetric.createRule(configs),
      FunctionLinesOfCodeMetric.createRule(configs),
      AvoidNonNullAssertionRule.createRule(configs),
      AvoidLateKeywordRule.createRule(configs),
      AvoidGlobalStateRule.createRule(configs),
      AvoidReturningWidgetsRule.createRule(configs),
      DoubleLiteralFormatRule.createRule(configs),
    ];

    // Return only enabled rules
    return supportedRules.where((r) => r.enabled).toList();
  }
}

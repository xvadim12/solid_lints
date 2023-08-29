import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:solid_lints/lints/avoid_unnecessary_type_assertions/visitor/avoid_unnecessary_type_assertions_visitor.dart';
import 'package:solid_lints/models/rule_config.dart';
import 'package:solid_lints/models/solid_lint_rule.dart';

class AvoidUnnecessaryTypeAssertionsRule extends SolidLintRule {
  static const lintName = 'avoid_unnecessary_type_assertions';

  AvoidUnnecessaryTypeAssertionsRule._(super.config);

  factory AvoidUnnecessaryTypeAssertionsRule.createRule(
    CustomLintConfigs configs,
  ) {
    final rule = RuleConfig(
      name: lintName,
      configs: configs,
      problemMessage: (_) => ''
          'TBD'
          'TBD',
    );
    return AvoidUnnecessaryTypeAssertionsRule._(rule);
  }

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final visitor = AvoidUnnecessaryTypeAssertionsVisitor();

    resolver.getResolvedUnitResult().then(
      (value) {
        value.unit.visitChildren(visitor);
        for (final element in visitor.expressions.keys) {
          reporter.reportErrorForNode(code, element);
        }
      },
    );
  }
}

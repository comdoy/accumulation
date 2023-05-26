

/// 审批拦截
class ApprovalIntercept with Exception {
  ApprovalIntercept([this.message]) : super();

  final String? message;

  @override
  String toString() {
    return message ?? "提交成功，等待审批完成";
  }
}

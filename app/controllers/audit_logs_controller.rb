class AuditLogsController < ApplicationController
  def index
    @audit_logs = AuditLog.all.page(params[:page]).per(5)
    authorize(@audit_logs)
  end
end

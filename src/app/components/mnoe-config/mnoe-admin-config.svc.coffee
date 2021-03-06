# This service is a wrapper around the config we fetch from the backend
# TODO: service or factory?

# MnoeAdminConfig.financeEnabled?
@App.factory 'MnoeAdminConfig', ($log, ADMIN_PANEL_CONFIG) ->
  _self = @

  @isAuditLogEnabled = () ->
    if ADMIN_PANEL_CONFIG.audit_log
      ADMIN_PANEL_CONFIG.audit_log.enabled
    else
      true

  @isImpersonationEnabled = () ->
    if ADMIN_PANEL_CONFIG.impersonation
      not ADMIN_PANEL_CONFIG.impersonation.disabled
    else
      true

  @isStaffEnabled = () ->
    if ADMIN_PANEL_CONFIG.staff?
      ADMIN_PANEL_CONFIG.staff.enabled
    else
      true

  @isFinanceEnabled = () ->
    if ADMIN_PANEL_CONFIG.finance?
      ADMIN_PANEL_CONFIG.finance.enabled
    else
      true

  @isAppManagementEnabled = () ->
    if ADMIN_PANEL_CONFIG.apps_management?
      ADMIN_PANEL_CONFIG.apps_management.enabled
    else
      true

  @isOrganizationManagementEnabled = () ->
    if ADMIN_PANEL_CONFIG.customer_management? && ADMIN_PANEL_CONFIG.customer_management.organization?
      ADMIN_PANEL_CONFIG.customer_management.organization.enabled
    else
      true

  @isUserManagementEnabled = () ->
    if ADMIN_PANEL_CONFIG.customer_management? && ADMIN_PANEL_CONFIG.customer_management.user?
      ADMIN_PANEL_CONFIG.customer_management.user.enabled
    else
      true

  return @

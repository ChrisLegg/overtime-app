# Overtime App

##Key requirement: Company needs documentation that salaried employees did or did not get overtime each week

##Models
- x Post -> date:date rationtale:text
- x User -> Devise
- x AdminUser -> STI
- AuditLog

##Features
- Approval Workflow
- SMS Sending -> link to approval or overtime input -> integrate with scheduler
- x Administration admin dashboard
- x Block non-admin and guest users from admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

## TODOS:

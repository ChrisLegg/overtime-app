# Overtime App

##Key requirement: Company needs documentation that salaried employees did or did not get overtime each week

##Models
- x Post -> date:date rationtale:text
- x User -> Devise
- x AdminUser -> STI

##Features
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- x Administration admin dashboard
- x Block non-admin and guest users from admin dashboard
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime

##UI:
- x Bootstrap -> formatting
- Icons from FontAwesome
- x Update the styles for forms

 ##Refactor TODOS:
 - Refactor user association integration test in post_spec
 - Refactor posts/_form for admin user with status

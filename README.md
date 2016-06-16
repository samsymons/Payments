# Payments

A demo app using the Siri API to accept payments. This app fakes all of its
actual payment interactions, and does not handle real currency.

### Payments

The Payments app consists of a basic app skeleton (single view controller and
almost no logic or UI), which is only used to request Siri access from the user.
Upon launching the app, `ViewController` will ask the user for access. It
doesn't handle declined permissions, since that isn't important here.

### Payments Intents Extension

This is the interesting part of the demo. The Intents extension is registered
with Siri to accept payments. It takes a fake contact book from `PaymentsCore`
and uses that data to determine whether payments should be allowed.

### Payments Intents UI Extension

This UI is just a placeholder for now. It doesn't use any of the information
provided by Siri, and instead displays a hardcoded string in a view controller.
I'll update this to display user data and a nicer interface later.

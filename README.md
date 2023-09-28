# Groups with URLScheme

This project is a PoC of an App with groups of users, where you can:

- Enter a group by opening an invite link.
- Share an invite for the groups you are in.

All done with no web APIs, only URLScheme.

## Enter group flow

1. User A who is already on a group taps on share button
2. User A sends group link (setup with URLScheme) copied to clipboard to new User B
3. User B opens link, which leads to the App.
4. User B enters his name and voilá! He enters the group.

## Disclaimer

This is NOT the safest way to do this kind of feature, but it can be a simple/fast way to implement it in a MVP project.

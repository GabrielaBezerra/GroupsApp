# Groups with URLScheme

This project is a PoC of an App with groups of users, where you can:

- Enter a group by opening an invite link.
- Share an invite for the groups you are in.

All done with no web APIs, only URLScheme.

## Enter group flow

1. User A who is already on a group taps on share button, copying invite link to the clipboard.
2. User A sends invite link to User B. (On the simulator, simply open safari, paste & open the link).
3. User B opens link, which leads to the App.
4. User B enters his name and voilá! He is now part of the group.

## Making it work for real

One way to make this work in a real App:

- [ ] Replace the mocked groups with groups that are stored in a remote database, which you access through some kind of API (CloudKit, Firebase, REST api hosted somewhere...).
- [ ] Create an invite link with a group ID that is stored on a group from the remote database.
- [ ] The `handle(url:)` function on `GroupListViewModel` should access this remote database and add the new member/user to it.
- [ ] The user should probably be a model, not a String.

## Disclaimer

This is NOT the safest way to do this kind of feature, but it can be a simple/fast way to implement it in a MVP project.

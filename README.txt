Name: Justin Kim
Uni: jyk2149

Create Tree:
    (from base dir)
    ./install-unpriv.sh [email tree name]

Install:
    (from base dir)
    make install DEST=./[email tree name]

Set Permissions:
    (from base dir)
    sudo ./install-priv.sh [email tree name]

Run Program:
    (from tree dir)
    bin/mail-in < [input file]


In order to protect the mailboxes and the mail executables, I first made each mailbox owned by the user of that Name.
For each user owned mailbox, I removed access from everyone else from writing, reading, or executing anything within the mailbox.
This not only prevents attackers from tampering with anything inside the mailbox, users other than the owner (and root) can not list what is
inside the mailbox. Then, I make both mail-in and mail-out privleged, and remove executable access from anyone but root so that only root/mail-in
can invoke it. Mail-In is safe to be privleged because the inputs are sanitized and use execl to ensure that only ./mail-in is being invoked (also usernames are sanitized).


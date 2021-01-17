This is an exercise of using OOP/POP to model the following requirements:

In Taiwan, to prevent tax evasion, the government demands big merchants to give consumers a receipt with a government-assigned number when a transaction happened.

If merchants honestly give consumers receipts with government assigned numbers,
the government can track the supposed tax amount with those numbers

To encourage consumers to ask for receipts from merchants when a transaction happened, the government turns the assigned number to the so-called Taiwan Receipt Lottery Number.

Here are simplified requirements for the receipt:

Each receipt has the following fields:
1. date
2. price
3. lottery number

, and some extras behavior based on the type of receipt:

b2b receipt can be sent through email or print out.
b2c receipt can be printed out or cached in the cloud with an identification called device id.
b2c receipt can be denoted to nonprofit organizations for the Taiwan Receipt Lottery opportunity.
a receipt can only be either a b2b, b2c cached in the cloud,  b2c donated, or b2c printed out receipt.

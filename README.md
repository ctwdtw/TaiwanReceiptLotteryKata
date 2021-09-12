### The purpose of this Kata:
Exercising using OOP/POP to model the domain of Taiwan Receipt Lottery.

### The challenge of this Kata: 
- Displaying different kinds of messages on a screen for different kinds of receipts. 
- Do not couple display/presentation logic with domain model if possible.
- Use as little `if ... else` statements as possible.
- Use abstraction techniques to remove duplicate/similar codes if possible.
- Do not use the `class` key word if possible (use the pop approach).
 

### What is Taiwan Receipt Lottery:

In Taiwan, to prevent tax evasion, the government demands big merchants to give consumers a receipt with a government-assigned number when a transaction happens.

If merchants honestly give consumers receipts with government assigned numbers,
the government can track the supposed tax amount with those numbers

To encourage consumers to ask for receipts from merchants when a transaction happens, the government turns the assigned number to the so-called Taiwan Receipt Lottery Number.

### A simplified specification of the receipts:
- Receipts are categorized as either a B2B or a B2C receipt.
- Receipts has three fields in common:
    1. Issued date
    2. Total price of purchased products
    3. The government assigned lottery number

- There are different ways that a merchant can deliver a receipt to a customer:

    1. B2B receipts were issued when a customer provides his/her company's tax id number to the merchants.
    2. B2B receipts were sent by email to a customer, or a customer can ask for a printed-out one sent by post.
    3. B2C receipts can be printed out, and given to a customer.
    4. B2C receipts can be cached in a cloud database of the goverment if a customer gives his/her mobile barcode id to the merchant for assing it to the receipt about to be issued.
    5. B2C receipts can be cached in a cloud database of the goverment, and donated to a nonprofit organization for the lottery opportunity, if a customer give an npo code to the merchant for assing it to the receipt about to be issued.

- Receipts can only be either a B2B, B2C with mobile barcode, B2C donated to npo, or B2C printed-out.

### Rules for displaying messages:
- Each message has three lines. Each lines are rendered in one `UILabel` instance.

- When a B2B receipt is issued, display the following message with the corresponding info such as company tax id, lottery number ... etc.:
```
A B2B receipt has been issued, the company tax id is 45002931.
The lottery number is: AA-00000001.
You can choose to print out this receipt or send it to your customer through email.
```

- When a B2C receipt is issued, and a customer mobile barcode is provided, display the following message with corresponding info:
```
A B2C receipt has been issued.
The lottery number is: AA-00000001.
The receipt is saved in cloud database with mobile barcode number: /AB201C9
```

- When a B2C receipt is issued, and a npo code is provided, display the following message with corresponding info:
```
A B2C receipt has been issued.
The lottery number is: AA-00000001.
The lottery opportunity has been donated to a non profit organization, the organization id is: 25885"
```

- When a B2C receipt is issued, and the customer does not provide niether his/her mobile bar code nor any npo code, display the following message with corresponding info:
```
A B2C receipt has been issued.
The lottery number is: AA-00000001.
The receipt has been printed.
```
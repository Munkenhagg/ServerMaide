# Troubleshooting

## Common issues

### Dependencies

- **serverMaide** is dependant on **openjdk-17+**, **Any Unix shell** and **wget**. function will be very limitied to zero without these packages

---

### Weird Configurations

- your server can **lose functionality** or be **unable to generate** if you have an unstable configuration. things that are likely to be the cause are **sandboxed environments**, **broken functions/aliases** or **outdated dependencies**

---

### permissions

- most of the provided scripts and directories are dependant of **read, execute, and write** permissions

- on a regular linux system fixing permissions should be as easy as **chmod -R 744 .** which recursively changes all the files permissions in the **current** directory to **-rwxr--r--.** or **drwxr--r--.** if it is a **directory**

---

### Wrong arguments

- incorrect arguments can cause trouble when dealing with your server. common mistakes can be allocating **too little RAM**, which results in lag, or a crash. Which can be handled by adding the arg **-Xmx4G** and changing 4 to however much memory you are willing to allocate to your server.

- another newbie mistake involving arguments can be forgetting to specify a -jar and running something like **java -Xmx1G paper.jar**
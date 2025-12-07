# Troubleshooting

## Common Issues

### Dependencies

- **serverMaide** depends on **openjdk-17+**, **any Unix shell**, and **wget**. Functionality will be extremely limited without these packages.

---

### Weird Configurations

- Your server can lose functionality or fail to generate if your environment is unstable. Common causes include **sandboxed environments**, **broken functions/aliases**, or **outdated dependencies**.

---

### Permissions

- Most provided scripts and directories require proper **read, write, and execute** permissions.

- On a typical Linux system, fixing permissions can be as simple as:

  ```bash
  chmod -R 744 .
  ```

  This sets files to `-rwxr--r--` and directories to `drwxr--r--`. (Note: directories usually need `x` to be usable.)

---

### Wrong Arguments

- Incorrect arguments can cause lag or crashes. A common issue is allocating too little RAM. You can fix this by adding:

  ```
  -Xmx4G
  ```

  Replace **4** with the amount of memory you want to allocate.

- Another common mistake is forgetting the `-jar` flag and running something like:

  ```bash
  java -Xmx1G paper.jar
  ```

---

## Playit

#### Playit Limitations

- Some broadband providers block Playit's API. This can cause errors like:

  ```
  Error: ClientError(RequestError(reqwest::Error {
    kind: Request,
    url: "https://api.playit.gg/claim/setup",
    source: hyper_util::client::legacy::Error(
      Connect,
      ConnectError("dns error", Custom {
        kind: Uncategorized,
        error: "failed to lookup address information: Try again"
      })
    )
  }))
  ```

  This is often not fixable unless you switch networks.

- You must have an internet connection to use Playit.
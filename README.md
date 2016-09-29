# pdf-camp

* merge
  ```
  qpdf --empty --pages #{[infile.pdf...]} -- #{outfile.pdf}
  ```

* split
  ```
  qpdf #{infile.pdf} --pages #{from}-#{to} -- #{outfile.pdf}
  ```

* linearize (for web)
  ```
  qpdf #{infile.pdf} --linearize #{outfile.pdf}
  ```

* encrypt (*todo*)
  ```
  qpdf #{infile.pdf} --encryption-file-password=#{password} #{outfile.pdf}
  ```
  
* decrypt (*todo*)
  ```
  qpdf #{infile.pdf} --password=#{password} --decrypt #{outfile.pdf}
  ```

# pdf-camp

### Setup

* install ocaml and opam

* run:
    * `opam init`
    * `opam config env`

* modify .login:
    * `source ~/.opam/opam-init/init.csh > & /dev/null || true`

* run:
    * `ocamlbuild -pkg opium.unix server.native`

* note:
    * default port = 3000

### Usage

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
  
* url to pdf

* upload file
http://qiita.com/uda0922/items/4e22908ce2acb3a28f29

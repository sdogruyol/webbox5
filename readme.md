# webBox5 PodCast

Her cuma yayınlanan 5 dakikalık developer podcast!

# Kurulum

Öncelikle `ruby 2.1.0` kurulu olmalı (`rvm` ya da `rbenv`)

    bundle install --path vendor/bundle
    bundle exec middleman

Deployment için root dizininde; `creds.rb` dosyasını oluşturun.

    SSH_USER = "kullancı adı"
    SSH_HOST = "sunucu"
    SSH_PATH = "/path/to/devpod.org"

gibi statik sayfaları sunacağınız web sunucusu ile ilgili bilgileri girin.

[http://webbox5.webbox.io](webbox5.webbox.io)

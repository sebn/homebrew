require 'formula'

class Plovr < Formula
  homepage 'http://plovr.com/'
  url 'http://plovr.googlecode.com/files/plovr-eba786b34df9.jar'
  sha1 'ae0166422f2d63f1f092a8484efeb41076876cf8'
  version 'r4453'

  depends_on 'closure-compiler'

  def script
    <<-SH.undent
      #!/bin/sh
      # Plovr wrapper script.
      java -jar #{prefix}/#{jar} $@
    SH
  end

  def jar
    'plovr-eba786b34df9.jar'
  end

  def install
    prefix.install jar
    (bin+'plovr').write script
  end

  def test
    system "#{bin}/plovr info"
  end
end

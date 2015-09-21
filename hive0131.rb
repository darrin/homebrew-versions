class Hive0131 < Formula
  homepage "https://hive.apache.org"
  url "https://archive.apache.org/dist/hive/hive-0.13.1/apache-hive-0.13.1-bin.tar.gz"
  sha256 "7085f5886fd70b774d7f2fcad86674d8ea5324d0cc7d59ba3c97495e43686c7f"

  depends_on "hadoop240"
  depends_on :java

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin conf examples lib ]
    libexec.install Dir["*.jar"]
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    Hadoop must be in your path for hive executable to work.
    After installation, set $HIVE_HOME in your profile:
      export HIVE_HOME=#{libexec}

    You may need to set JAVA_HOME:
      export JAVA_HOME="$(/usr/libexec/java_home)"
    EOS
  end
end

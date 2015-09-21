class Hive011 < Formula
  homepage "https://hive.apache.org"
  url "https://archive.apache.org/dist/hive/hive-0.13.1/hive-0.13.1-bin.tar.gz"
  md5 "8c9fc9391375a67832db39ea3deaaa02"

  # depends_on "hadoop"
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

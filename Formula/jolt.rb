class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.31/jolt-v0.8.31-aarch64-macos.tar.gz"
      sha256 "856ee3aa7843098ea4a467ef9be9503e6788b049997a929119cf8172efa7bbef"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.31/jolt-v0.8.31-x86_64-macos.tar.gz"
      sha256 "f25e946bf7489af208eaa2f18b325dec8684419ecb20a8945f2b91f3904a23a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.31/jolt-v0.8.31-x86_64-linux.tar.gz"
      sha256 "9c418141581cc4744024c8ec2ea6c2caf14181264455a787ccac9db21e8069da"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end

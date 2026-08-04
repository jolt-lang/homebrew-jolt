class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.2/jolt-v0.6.2-aarch64-macos.tar.gz"
      sha256 "883992d088f414eae5cb945d691dd286086d18f86bedd32f8796e660b54e194b"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.2/jolt-v0.6.2-x86_64-linux.tar.gz"
      sha256 "4d153cb3975e5da3ecfea631be72e23a5e9186f69e0bf26dbb188412b936a9e6"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end

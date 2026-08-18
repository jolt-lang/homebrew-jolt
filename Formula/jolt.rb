class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.15/jolt-v0.7.15-aarch64-macos.tar.gz"
      sha256 "54898cfd80f64a47c5e70349a79e76029cea1251f631bf7c5429d8ba5c10abcd"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.15/jolt-v0.7.15-x86_64-linux.tar.gz"
      sha256 "5e714f6c5fae698f0087cf90bb260d79252cf215c03d7b25d9ae0998023b732c"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end

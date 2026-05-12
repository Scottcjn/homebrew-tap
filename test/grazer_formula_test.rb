# frozen_string_literal: true

require "minitest/autorun"

class FormulaPath
  attr_reader :symlinks

  def initialize(path)
    @path = path
    @symlinks = []
  end

  def install_symlink(paths)
    @symlinks << paths
  end

  def to_s
    @path
  end
end

class Formula
  class << self
    attr_reader :desc_value, :homepage_value, :url_value, :sha256_value,
                :license_value, :dependencies, :test_block

    def desc(value)
      @desc_value = value
    end

    def homepage(value)
      @homepage_value = value
    end

    def url(value)
      @url_value = value
    end

    def sha256(value)
      @sha256_value = value
    end

    def license(value)
      @license_value = value
    end

    def depends_on(value)
      @dependencies ||= []
      @dependencies << value
    end

    def test(&block)
      @test_block = block
    end
  end

  attr_reader :system_calls, :shell_outputs, :bin_path

  def initialize
    @bin_path = FormulaPath.new("/tmp/homebrew-bin")
  end

  def system(*args)
    @system_calls ||= []
    @system_calls << args
  end

  def shell_output(command)
    @shell_outputs ||= []
    @shell_outputs << command
    "grazer-skill 1.7.0\n"
  end

  def assert_match(expected, actual)
    raise "expected #{actual.inspect} to include #{expected.inspect}" unless actual.include?(expected)
  end

  def std_npm_args
    ["--prefix=/tmp/homebrew-libexec"]
  end

  def libexec
    "/tmp/homebrew-libexec"
  end

  def bin
    @bin_path
  end
end

load File.expand_path("../Formula/grazer.rb", __dir__)

class GrazerFormulaTest < Minitest::Test
  def test_formula_metadata
    assert_equal "Multi-platform content discovery for AI agents", Grazer.desc_value
    assert_equal "https://github.com/Scottcjn/grazer-skill", Grazer.homepage_value
    assert_equal "https://registry.npmjs.org/grazer-skill/-/grazer-skill-1.7.0.tgz", Grazer.url_value
    assert_equal "6329e4affe490f14526a95d9b52be5b1f379be31b034cfafffcc667e807e2b98", Grazer.sha256_value
    assert_equal "MIT", Grazer.license_value
    assert_equal ["node"], Grazer.dependencies
  end

  def test_install_uses_npm_and_links_binaries
    formula = Grazer.new
    formula.install

    assert_equal [["npm", "install", "--prefix=/tmp/homebrew-libexec"]], formula.system_calls
    assert_equal [[]], formula.bin_path.symlinks
  end

  def test_homebrew_test_checks_grazer_version
    formula = Grazer.new
    formula.instance_eval(&Grazer.test_block)

    assert_equal ["/tmp/homebrew-bin/grazer --version"], formula.shell_outputs
  end

  def test_version_is_consistent_across_url_and_test_block
    assert_includes Grazer.url_value, "grazer-skill-1.7.0.tgz"

    formula = Grazer.new
    formula.instance_eval(&Grazer.test_block)

    assert_equal ["/tmp/homebrew-bin/grazer --version"], formula.shell_outputs
  end
end

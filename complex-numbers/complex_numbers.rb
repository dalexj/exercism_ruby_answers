require "bigdecimal/math"

class ComplexNumber
  attr_reader :real, :imaginary
  def initialize(real, imaginary)
    @real = real.to_f
    @imaginary = imaginary.to_f
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    # (a + i * b) * (c + i * d) = (a * c - b * d) + (b * c + a * d) * i
    a = real
    b = imaginary
    c = other.real
    d = other.imaginary
    ComplexNumber.new(
      (a * c - b * d),
      (b * c + a * d),
    )
  end

  def /(other)
    # (a + i * b) / (c + i * d) = (a * c + b * d)/(c^2 + d^2) + (b * c - a * d)/(c^2 + d^2) * i
    a = real
    b = imaginary
    c = other.real
    d = other.imaginary
    ComplexNumber.new(
      ((a * c + b * d)/(c*c + d*d)),
      ((b * c - a * d)/(c*c + d*d)),
    )
  end

  def abs
    Math.sqrt((real * real) + (imaginary * imaginary))
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    # `exp(a + i * b) = exp(a) * exp(i * b)`,
    # and the last term is given by Euler's formula `exp(i * b) = cos(b) + i * sin(b)
    ComplexNumber.new(Math.exp(real), 0) * ComplexNumber.new(Math.cos(imaginary), Math.sin(imaginary))
  end

  def ==(other)
    real == other.real && imaginary == other.imaginary
  end
end

class BookKeeping
  VERSION = 1
end

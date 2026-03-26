import './Hero.css'

function Hero() {
  return (
    <section className="hero">
      <div className="hero-content">
        <h1 className="hero-name">Luke Solomon</h1>
        <p className="hero-tagline">Building things that matter</p>
        <div className="hero-meta">
          <span>New York</span>
          <span className="hero-sep">/</span>
          <span>iOS & Web</span>
        </div>
      </div>
    </section>
  )
}

export default Hero

import './Socials.css'

const links = [
  { name: 'GitHub', url: 'https://github.com/nsluke' },
  { name: 'Instagram', url: 'https://www.instagram.com/luke_solomon/' },
  { name: 'X / Twitter', url: 'https://twitter.com/_luke_warm' },
  { name: 'LinkedIn', url: 'https://www.linkedin.com/in/luke-solomon-7b846375/' },
  { name: 'Email', url: 'mailto:solomora+portfolio@gmail.com' },
  { name: 'MySpace', url: '/myspace/' },
]

function Socials() {
  return (
    <section className="socials">
      <div className="socials-header">
        <span className="section-label">Connect</span>
      </div>
      <div className="socials-grid">
        {links.map((link) => (
          <a
            key={link.name}
            href={link.url}
            {...(link.url.startsWith('/') ? {} : { target: '_blank', rel: 'noopener noreferrer' })}
            className="social-link"
          >
            <span className="social-name">{link.name}</span>
            <span className="social-arrow">-&gt;</span>
          </a>
        ))}
      </div>
    </section>
  )
}

export default Socials

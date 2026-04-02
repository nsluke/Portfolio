import { useState } from 'react'
import './Projects.css'

const projects = [
  {
    name: 'Treachery',
    description: 'Multiplayer MTG Variant for iOS',
    tech: 'Swift',
    github: 'https://github.com/paintedlabs/Treachery-FrontEnd',
    liveUrl: 'https://treachery.games',
    liveLabel: 'Play',
  },
  {
    name: 'The Lazer Dragon Workout Experience',
    description: 'Think you can take on the Lazer Dragon?',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Lazer-Dragon-Workout-Experience',
  },
  {
    name: 'Claudius',
    description: 'Track your claude usage right in your menu bar',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Claudius',
    liveUrl: 'https://github.com/nsluke/Claudius/releases',
    liveLabel: 'Download',
  },
  {
    name: 'Manadrain',
    description: 'Stash your favorite cards for later.',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/manadrain',
    liveUrl: 'https://addons.mozilla.org/en-US/firefox/addon/manadrain-mtg-shopping-list/',
    liveLabel: 'Firefox Add-on',
  },
  {
    name: 'Planechase Bot',
    description: 'Discord bot for playing Planechase',
    tech: 'Python',
    github: 'https://github.com/nsluke/Planechase-Bot',
  },
  {
    name: 'PushPush',
    description: 'The First game I ever made. Aged like fine wine.',
    tech: 'Objective-C',
    github: 'https://github.com/nsluke/PushPush',
  },
  {
    name: 'Mock Starket',
    description: 'Buy REAL fake stocks and lose real fake money',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Mock-Starket-iOS',
  },
  {
    name: 'Bling My Deck',
    description: 'Find the most expensive printing of every card in your MTG deck',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/blingmydeck',
    liveUrl: 'https://blingoutmydeck.com',
    liveLabel: 'Visit',
  },
]

function Projects() {
  const [hovered, setHovered] = useState(null)

  return (
    <section className="projects" id="projects">
      <div className="projects-header">
        <span className="section-label">Selected Work</span>
        <span className="project-count">{projects.length} Projects</span>
      </div>
      <div className="projects-list">
        {projects.map((project, i) => (
          <div
            key={project.name}
            className={`project-row ${hovered !== null && hovered !== i ? 'dimmed' : ''}`}
            onMouseEnter={() => setHovered(i)}
            onMouseLeave={() => setHovered(null)}
          >
            <div className="project-index">
              {String(i + 1).padStart(2, '0')}
            </div>
            <div className="project-info">
              <h3 className="project-name">{project.name}</h3>
              <p className="project-desc">{project.description}</p>
              <span className="project-tech">{project.tech}</span>
            </div>
            <div className="project-links">
              <a
                href={project.github}
                target="_blank"
                rel="noopener noreferrer"
                className="project-link"
              >
                GitHub
              </a>
              {project.liveUrl ? (
                <a
                  href={project.liveUrl}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="project-link project-link-live"
                >
                  {project.liveLabel} -&gt;
                </a>
              ) : (
                <span className="project-link project-link-soon">Coming Soon</span>
              )}
            </div>
          </div>
        ))}
      </div>
    </section>
  )
}

export default Projects

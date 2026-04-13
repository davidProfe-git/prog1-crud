/* ============================================
   BLACKOUT ARSENAL — app.js
   Consume la API del backend y renderiza cards
   ============================================ */

// ——— CONFIGURACIÓN ———
const API_BASE = 'http://localhost:3000';

const MAX_DAMAGE = 200; // Para calcular el % de la barra de daño

// ——— ÍCONOS PLACEHOLDER según tipo ———
const ICONS = {
    keycards: '⬡',
    melee: '⚔',
    fire: '⊕',
};

// ——— RAREZA → clase CSS ———
function rarityClass(rareza) {
    const map = {
        'Comun': 'rarity-Comun',
        'Poco Comun': 'rarity-PocoComon',
        'Raro': 'rarity-Raro',
        'Epico': 'rarity-Epico',
        'Legendario': 'rarity-Legendario',
    };
    return map[rareza] || 'rarity-Comun';
}

// ——— FORMATEAR PRECIO ———
function formatPrice(valor) {
    if (valor == 0) return 'GRATIS';
    return '$' + Number(valor).toLocaleString('es-CO');
}

// ——— RENDER: KEYCARD ———
function renderKeycard(t, index) {
    const card = document.createElement('div');
    card.className = 'card';
    card.setAttribute('data-rarity', t.rareza);
    card.style.animationDelay = `${index * 60}ms`;

    card.innerHTML = `
        <div class="card-img">
            <img src="${t.imagen_url}" alt="${t.nombre}"
                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'">
            <div class="placeholder" style="display:none">⬡</div>
            <div class="rarity-badge ${rarityClass(t.rareza)}">${t.rareza}</div>
        </div>
        <div class="card-body">
            <div class="card-name">${t.nombre}</div>
            <div class="card-stats">
                <div class="stat">
                    <span class="stat-label">USOS</span>
                    <span class="stat-value">${t.usos}</span>
                </div>
                <div class="stat">
                    <span class="stat-label">VALOR</span>
                    <span class="stat-value accent">${formatPrice(t.valor)}</span>
                </div>
            </div>
        </div>
    `;
    return card;
}

// ——— RENDER: MELEE WEAPON ———
function renderMelee(w, index) {
    const card = document.createElement('div');
    card.className = 'card';
    card.setAttribute('data-rarity', w.rareza);
    card.style.animationDelay = `${index * 50}ms`;

    const dmgPct = Math.min((w.daño / MAX_DAMAGE) * 100, 100).toFixed(1);

    card.innerHTML = `
        <div class="card-img">
            <img src="${w.imagen_url}" alt="${w.nombre}"
                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'">
            <div class="placeholder" style="display:none">⚔</div>
            <div class="rarity-badge ${rarityClass(w.rareza)}">${w.rareza}</div>
        </div>
        <div class="card-body">
            <div class="card-name">${w.nombre}</div>
            <div class="card-stats">
                <div class="stat" style="flex-wrap:wrap; gap:4px;">
                    <span class="stat-label">DAÑO</span>
                    <div class="dmg-bar-wrap">
                        <div class="dmg-bar" style="width:${dmgPct}%"></div>
                    </div>
                    <span class="stat-value">${w.daño}</span>
                </div>
                <div class="stat">
                    <span class="stat-label">VALOR</span>
                    <span class="stat-value accent">${formatPrice(w.valor)}</span>
                </div>
            </div>
        </div>
    `;
    return card;
}

// ——— RENDER: FIRE WEAPON ———
function renderFire(w, index) {
    const card = document.createElement('div');
    card.className = 'card';
    card.setAttribute('data-rarity', w.rareza);
    card.style.animationDelay = `${index * 50}ms`;

    const dmgPct = Math.min((w.daño / MAX_DAMAGE) * 100, 100).toFixed(1);

    card.innerHTML = `
        <div class="card-img">
            <img src="${w.imagen_url}" alt="${w.nombre}"
                 onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'">
            <div class="placeholder" style="display:none">⊕</div>
            <div class="rarity-badge ${rarityClass(w.rareza)}">${w.rareza}</div>
        </div>
        <div class="card-body">
            <div class="card-name">${w.nombre}</div>
            <div class="card-stats">
                <div class="stat" style="flex-wrap:wrap; gap:4px;">
                    <span class="stat-label">DAÑO</span>
                    <div class="dmg-bar-wrap">
                        <div class="dmg-bar" style="width:${dmgPct}%"></div>
                    </div>
                    <span class="stat-value">${w.daño}</span>
                </div>
                <div class="stat">
                    <span class="stat-label">MUNICIÓN</span>
                    <span class="stat-value">${w.capacidad_municion} rds</span>
                </div>
                <div class="stat">
                    <span class="stat-label">VALOR</span>
                    <span class="stat-value accent">${formatPrice(w.valor)}</span>
                </div>
            </div>
        </div>
    `;
    return card;
}

// ——— FETCH GENÉRICO ———
async function fetchData(endpoint) {
    const res = await fetch(`${API_BASE}${endpoint}`);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const json = await res.json();
    // El backend responde { data: [...] } según GameController
    return json.data ?? json;
}

// ——— CARGAR Y RENDERIZAR ———
async function loadSection(endpoint, gridId, renderFn) {
    const grid = document.getElementById(gridId);
    try {
        const items = await fetchData(endpoint);
        grid.innerHTML = '';
        if (!items || items.length === 0) {
            grid.innerHTML = '<div class="error-msg">SIN DATOS DISPONIBLES</div>';
            return;
        }
        items.forEach((item, i) => grid.appendChild(renderFn(item, i)));
    } catch (err) {
        grid.innerHTML = `<div class="error-msg">${err.message} — verifica que el servidor esté corriendo</div>`;
    }
}

// ——— TABS ———
document.querySelectorAll('.tab').forEach(btn => {
    btn.addEventListener('click', () => {
        document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.panel').forEach(p => p.classList.remove('active'));
        btn.classList.add('active');
        document.getElementById(btn.dataset.tab).classList.add('active');
    });
});

// ——— INICIAR ———
loadSection('/keycards', 'keycards-grid', renderKeycard);
loadSection('/melee',    'melee-grid',    renderMelee);
loadSection('/fire',     'fire-grid',     renderFire);
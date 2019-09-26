const config = {
    torrentUnits: () => process.env.PURGE_TORRENTS_UNIT || 'days',
    torrentAmount: () => process.env.PURGE_TORRENTS_AMOUNT || 17,
    torrentKeep: () => process.env.PURGE_TORRENTS_KEEP || false,
    torrentHost: () => process.env.PURGE_TORRENTS_HOST || '127.0.0.1',
    torrentPort: () => process.env.PURGE_TORRENTS_PORT || 9091,
    torrentUser: () => process.env.PURGE_TORRENTS_USER || '',
    torrentPass: () => process.env.PURGE_TORRENTS_PASS || '',
    torrentAuth: () => process.env.PURGE_TORRENTS_AUTH || '',
};
console.log(`${config.torrentAmount()}`);

#!/bin/bash
# create_literary_files.sh
# Creates 6 literary text files for Game of Dockers project

echo "📚 Creating literary text files for Game of Dockers..."
echo "======================================================"

# Go to project directory
cd ~/game_of_dockers 2>/dev/null || {
    echo "❌ Error: ~/game_of_dockers folder not found!"
    echo "Please run from project folder or create it first."
    exit 1
}

# Create folder structure
echo "Creating folder structure..."
mkdir -p docker-test/Docker{1,2,3}

# File 1: Mockingbird quotes (Docker1)
echo "Creating Docker1/file1.txt (Mockingbird quotes)..."
cat > docker-test/Docker1/file1.txt << 'EOF'
That's why it's a sin to kill a mockingbird.
"Your father's right," she said. "Mockingbirds don't do one thing except make music for us to enjoy.
That was the only time I ever heard Atticus say it was a sin to do something, and I asked Miss Maudie about it. They don't eat up people's gardens, don't nest in corn cribs, they don't do one thing but sing their hearts out for us.
Atticus said to Jem one day, "I'd rather you shot at tin cans in the backyard, but I know you'll go after birds.
Shoot all the blue jays you want, if you can hit 'em, but remember it's a sin to kill a mockingbird.
EOF

# File 2: Secrets & important things (Docker1)
echo "Creating Docker1/file2.txt (Secrets & important things)..."
cat > docker-test/Docker1/file2.txt << 'EOF'
The most important things are the hardest to say. They are the things you get ashamed of, because words diminish them — words shrink things that seemed limitless when they were in your head to no more than living size when they're brought out.
The most important things lie too close to wherever your secret heart is buried, like landmarks to a treasure your enemies would love to steal away.
That's the worst, I think. When the secret stays locked within not for want of a teller but for want of an understanding ear.
EOF

# File 3: Storm begins (Docker2)
echo "Creating Docker2/file3.txt (The storm begins)..."
cat > docker-test/Docker2/file3.txt << 'EOF'
But it's more than that, isn't it? But one thing is certain. When you come out of the storm you won't be the same person who walked in. That's what this storm's all about.
Why? Because this storm isn't something that blew in from far away, something that has nothing to do with you. This storm is you. Something inside of you. And once the storm is over you won't remember how you made it through, how you managed to survive. You won't even be sure, in fact, whether the storm is really over.
EOF

# File 4: Sandstorm metaphor (Docker2)
echo "Creating Docker2/file4.txt (Sandstorm metaphor)..."
cat > docker-test/Docker2/file4.txt << 'EOF'
"Sometimes fate is like a small sandstorm that keeps changing directions. You change direction but the sandstorm chases you. You turn again, but the storm adjusts. Over and over you play this out, like some ominous dance with death just before dawn."
So all you can do is give in to it, step right inside the storm, closing your eyes and plugging up your ears so the sand doesn't get in, and walk through it, step by step. There's no sun there, no moon, no direction, no sense of time. Just fine white sand swirling up into the sky like pulverized bones. That's the kind of sandstorm you need to imagine.
And you really will have to make it through that violent, metaphysical, symbolic storm. No matter how metaphysical or symbolic it might be, make no mistake about it: it will cut through flesh like a thousand razor blades.
EOF

# File 5: Blood & revelation (Docker3)
echo "Creating Docker3/file5.txt (Blood & revelation)..."
cat > docker-test/Docker3/file5.txt << 'EOF'
People will bleed there, and you will bleed too. Hot, red blood. You'll catch that blood in your hands, your own blood and the blood of others.
And you may make revelations that cost you dearly only to have people look at you in a funny way, not understanding what you've said at all, or why you thought it was so important that you almost cried while you were saying it.
EOF

# File 6: Short quotes (Docker3)
echo "Creating Docker3/file6.txt (Short quotes)..."
cat > docker-test/Docker3/file6.txt << 'EOF'
Mockingbirds don't do one thing but sing their hearts out for us.
The storm is you. Something inside of you.
Words shrink things that seemed limitless.
It's a sin to kill a mockingbird.
Walk through the storm, step by step.
EOF

echo ""
echo "✅ All 6 files created successfully!"
echo ""
echo "📁 File structure created:"
tree docker-test/ 2>/dev/null || ls -la docker-test/Docker*/
echo ""
echo "📊 File sizes (for sorting demonstration):"
echo "Container 1 (Docker1):"
ls -la docker-test/Docker1/*.txt | awk '{print $5, "bytes:", $9}'
echo ""
echo "Container 2 (Docker2):"
ls -la docker-test/Docker2/*.txt | awk '{print $5, "bytes:", $9}'
echo ""
echo "Container 3 (Docker3):"
ls -la docker-test/Docker3/*.txt | awk '{print $5, "bytes:", $9}'
echo ""
echo "🚀 Now run the main script:"
echo "   sudo ./game_of_dockers.sh"
echo ""
echo "📝 Note: Container 1 & 3 files will be sorted by size (smallest first)"
echo "       Container 2 files will be processed in original order"
